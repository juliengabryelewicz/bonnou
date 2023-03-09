import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/controllers/rss_controller.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/bad_news/app_bar.dart';
import 'package:bonnou/widgets/common/drawer.dart';
import 'package:bonnou/widgets/bad_news/display_bad_news.dart';

class BadNewsPage extends StatelessWidget {
  BadNewsPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final RssController _rssController = Get.put(RssController());

  @override
  Widget build(BuildContext context) {
    _rssController.getAllNews();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                pressToOpenDrawer: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              verticalSpace(30),
              DisplayBadNews(),
            ],
          ),
        ),
      ),
    );
  }
}