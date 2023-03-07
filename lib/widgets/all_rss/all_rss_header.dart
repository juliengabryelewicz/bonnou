import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/routes/routes.dart';
import 'package:bonnou/widgets/common/custom_button.dart';

class AllRssHeader extends StatelessWidget {
  const AllRssHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
          ),
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
        CustomButton(
          onTap: () {
            Get.toNamed(
              MyRoutes.getCreateRssRoute(),
            );
          },
          label: 'Ajouter un lien RSS',
          iconData: Icons.add,
        ),
      ],
    );
  }
}