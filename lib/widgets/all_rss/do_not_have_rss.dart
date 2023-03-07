import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/routes/routes.dart';

class DoNotHaveRss extends StatelessWidget {
  const DoNotHaveRss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vous n'avez pas de liens RSS",
            style: textStyleBoldBlack(30),
          ),
          Row(
            children: [
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateRssRoute());
                  },
                  child: Text(
                    "Créer",
                    style: textStyleBoldBlue(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}