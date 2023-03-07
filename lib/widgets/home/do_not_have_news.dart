import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/routes/routes.dart';

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
            "Vous n'avez pas d'articles",
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
                    "Créer un lien RSS",
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