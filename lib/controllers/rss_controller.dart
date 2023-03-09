import 'dart:convert';

import 'package:get/get.dart';
import 'package:bonnou/database/database_helper.dart';
import 'package:bonnou/models/rss_model.dart';
import 'package:bonnou/utils/classifier.dart';
import 'package:bonnou/utils/sort_rss.dart';
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:http/http.dart';
import 'package:get_storage/get_storage.dart';

class RssController extends GetxController {
  var rssList = <RssModel>[].obs;
  var rssById = <RssModel>[].obs;
  var goodNewsList = <RssItem>[].obs;
  var badNewsList = <RssItem>[].obs;
  final _classifier = Classifier();

  @override
  void onInit() {
    getAllRss();
    super.onInit();
  }

  Future<void> addRss(String title, String link) async {
    final RssModel newRss = RssModel(
      title: title.trim(),
      link: link.trim(),
    );
    await DatabaseHelper.insert(newRss);
    getAllRss();
  }

  Future<void> updateRss(int id, String title, String link) async {
    final RssModel editRss = RssModel(
      id: id,
      title: title.trim(),
      link: link.trim(),
    );
    await DatabaseHelper.update(id, editRss);
    getAllRss();
  }

  void getAllRss() async {
    List<Map<String, dynamic>> allRss =
    await DatabaseHelper.query() as List<Map<String, dynamic>>;
    rssList.value = allRss.map((data) => RssModel.fromJson(data)).toList();
    getAllNews();
  }

  getAllNews() async {
    List<RssItem> rssGoodItemList = <RssItem>[];
    List<RssItem> rssBadItemList = <RssItem>[];
    String _stopwords = GetStorage().read("stopwords") ?? "";
    List<String>? listStopWords = _stopwords.trim() != "" ? _stopwords.trim().toLowerCase().split(",") : null;
    for (var i=0; i<rssList.length; i++) {
      var res = await get(Uri.parse(rssList[i].link!));
      if (res.statusCode == 200) {
        var rssFeed = RssFeed.parse(utf8.decode(res.body.runes.toList()));
        for (RssItem item in rssFeed.items!) {
          List<double> scores_title = _classifier.classify(item.title ?? "");
          List<double> scores_description = _classifier.classify(item.description ?? "");

          if (listStopWords != null && listStopWords.any((element) => item.title!.toLowerCase().contains(element.trim()))) {
            rssBadItemList.add(item);
          } else if(scores_title[0] >= 0.5 && scores_description[0] >= 0.5){
            rssGoodItemList.add(item);
          } else {
            rssBadItemList.add(item);
          }
        }
      }
    }

    sortByDate(rssGoodItemList);
    sortByDate(rssBadItemList);

    goodNewsList.value = rssGoodItemList;
    badNewsList.value = rssBadItemList;
  }

  void delete(RssModel rss) async {
    await DatabaseHelper.delete(rss);
    getAllRss();
  }

  void getRssById(int id) async {
    List<Map<String, dynamic>> rss = await DatabaseHelper.queryRssById(id);
    rssById.assignAll(rss.map((data) => RssModel.fromJson(data)));
  }
}