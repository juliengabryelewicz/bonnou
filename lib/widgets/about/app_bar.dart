import 'package:flutter/material.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/common/custom_circle_container.dart';

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
        Text('A propos', style: textStyleBoldBlack(24)),
      ],
    );
  }
}