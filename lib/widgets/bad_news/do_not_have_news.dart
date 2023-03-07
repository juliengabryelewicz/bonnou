import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';

class DoNotHaveNews extends StatelessWidget {
  const DoNotHaveNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vous n'avez pas d'articles indésirables",
            style: textStyleBoldBlack(30),
          ),
        ],
      ),
    );
  }
}