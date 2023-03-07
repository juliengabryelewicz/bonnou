import 'package:flutter/material.dart';
import 'package:bonnou/routes/routes.dart';
import 'package:bonnou/widgets/common/custom_circle_container.dart';
import 'package:bonnou/widgets/common/custom_button.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.pressToOpenDrawer}) : super(key: key);

  final VoidCallback? pressToOpenDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: pressToOpenDrawer,
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        CustomButton(
          onTap: () {
            Get.toNamed(
              MyRoutes.getCreateRssRoute(),
            );
          },
          label: 'Ajouter',
          iconData: Icons.add,
        ),
      ],
    );
  }
}