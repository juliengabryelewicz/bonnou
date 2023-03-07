import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/models/rss_model.dart';
import 'package:bonnou/utils/constants.dart';

class RssTile extends StatelessWidget {
  const RssTile({Key? key, required this.rss}) : super(key: key);

  final RssModel rss;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 65,
            width: Get.width * 0.8,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rss.title.toString(),
                  style: textStyleBoldBlack(20),
                  softWrap: false,
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