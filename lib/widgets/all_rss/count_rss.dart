import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/all_rss/do_not_have_rss.dart';
import 'package:bonnou/controllers/rss_controller.dart';

class CountRss extends StatelessWidget {
  CountRss({Key? key}) : super(key: key);
  final RssController _rssController = Get.find<RssController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        final rssList = _rssController.rssList;
        return rssList.isNotEmpty
            ? Text(
          "Nombre de flux RSS : ${rssList.length} ",
          style: textStyleBoldBlack(20),
          )
            : verticalSpace(20);
      },
    );
  }
}