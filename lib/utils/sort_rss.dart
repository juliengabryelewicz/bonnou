import 'package:webfeed_plus/webfeed_plus.dart';

void sortByDate(List<RssItem> rssList) {
  return rssList.sort((a,b) {
    var aPubDate = a.pubDate;
    var bPubDate = b.pubDate;
    return bPubDate!.compareTo(aPubDate!);
  });
}