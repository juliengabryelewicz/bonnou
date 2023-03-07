import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:webfeed_plus/webfeed_plus.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.news}) : super(key: key);

  final RssItem news;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: Get.width * 0.8,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  news.title.toString(),
                  style: textStyleBoldBlack(20),
                  softWrap: true,
                ),
                Text(
                  news.pubDate.toString(),
                  style: textStyleBlack(14),
                  softWrap: true,
                ),
                Text(
                  news.description.toString(),
                  style: textStyleBlack(16),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 2),
      ],
    );
  }
}