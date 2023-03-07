import 'package:flutter/material.dart';
import 'package:bonnou/widgets/settings/settings_header.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/settings/display_stopwords.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsHeader(),
              verticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Text('Mots interdits', style: textStyleBlack(20)),
                ],
              ),
              DisplayStopwords(),
            ],
          ),
        ),
      ),
    );
  }
}