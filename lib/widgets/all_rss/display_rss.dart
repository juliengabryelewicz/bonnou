import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/routes/routes.dart';
import 'package:bonnou/widgets/all_rss/do_not_have_rss.dart';
import 'package:bonnou/widgets/all_rss/rss_tile.dart';
import 'package:bonnou/controllers/rss_controller.dart';

class DisplayRss extends StatelessWidget {
  DisplayRss({Key? key}) : super(key: key);
  final RssController _rssController = Get.find<RssController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        final rssList = _rssController.rssList;
        return rssList.isNotEmpty
            ? ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rssList.length,
          itemBuilder: (ctx, index) {
            final rss = rssList[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Get.toNamed(
                  MyRoutes.getUpdateRssRoute(),
                  arguments: {'rss': rss},
                );
              },
              child: RssTile(rss: rss),
            );
          },
        )
            : const DoNotHaveRss();
      },
    );
  }
}