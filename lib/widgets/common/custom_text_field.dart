import 'package:flutter/material.dart';
import 'package:bonnou/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        this.controller,
        required this.label,
        required this.hintText,
        this.onTap,
        this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyleBlack(20)),
        TextField(
          readOnly: readOnly as bool,
          maxLines: 1,
          controller: controller,
          style: textStyleBoldBlack(18),
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(14),
            hintText: hintText,
            hintStyle: textStyleBoldGrey(18),
            border: InputBorder.none,
            enabledBorder: _borders(),
            focusedBorder: _borders(),
            disabledBorder: _borders(),
          ),
        ),
        verticalSpace(20),
      ],
    );
  }

  _borders() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 1,
        color: Colors.blue.withOpacity(0.3),
      ),
    );
  }
}