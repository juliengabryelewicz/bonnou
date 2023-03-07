import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/widgets/home/do_not_have_news.dart';
import 'package:bonnou/widgets/home/news_tile.dart';
import 'package:bonnou/controllers/rss_controller.dart';

class DisplayNews extends StatelessWidget {
  DisplayNews({Key? key}) : super(key: key);
  final RssController _rssController = Get.put(RssController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        final newsList = _rssController.goodNewsList;
        return newsList.isNotEmpty
            ? ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (ctx, index) {
            final news = newsList[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              child: NewsTile(news: news),
            );
          },
        )
            : const DoNotHaveNews();
      },
    );
  }
}