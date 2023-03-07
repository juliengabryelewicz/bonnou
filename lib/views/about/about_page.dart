import 'package:flutter/material.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/about/app_bar.dart';
import 'package:bonnou/widgets/common/drawer.dart';
import 'package:bonnou/widgets/about/display_about.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              DisplayAbout(),
            ],
          ),
        ),
      ),
    );
  }
}