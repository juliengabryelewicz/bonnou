import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/common/custom_circle_container.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
          ),
        ),
        Text(
          "Paramètres",
          style: textStyleBoldBlack(22),
        ),
      ],
    );
  }
}