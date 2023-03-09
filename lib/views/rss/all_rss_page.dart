import 'package:flutter/material.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/all_rss/app_bar.dart';
import 'package:bonnou/widgets/all_rss/display_rss.dart';
import 'package:bonnou/widgets/all_rss/count_rss.dart';
import 'package:bonnou/widgets/common/drawer.dart';

class AllRssPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAppBar(
                pressToOpenDrawer: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              verticalSpace(30),
              CountRss(),
              verticalSpace(20),
              DisplayRss(),
            ],
          ),
        ),
      ),
    );
  }
}