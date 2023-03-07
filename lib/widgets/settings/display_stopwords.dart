import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/controllers/settings_controller.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/widgets/common/custom_text_field.dart';
import 'package:bonnou/widgets/common/custom_button.dart';

class DisplayStopwords extends StatelessWidget {
  DisplayStopwords({Key? key}) : super(key: key);

  final TextEditingController _stopwordsController = TextEditingController();
  final SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    _stopwordsController.text = _settingsController.stopwords.value;
    return Row(
      children: [
        Obx(() {
          return Text(
            _settingsController.stopwords.value,
            style: textStyleBoldBlack(24),
            maxLines: 2,
          );
        }),
        IconButton(
          onPressed: () => _showDialog(context),
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: SizedBox(
            height: Get.height * 0.25,
            child: Column(
              children: [
                Text('Entrez les mots interdits', style: textStyleBoldBlack(20)),
                CustomTextField(
                  controller: _stopwordsController,
                  label: '',
                  hintText: 'Entrez vos mots interdits, séparés par une virgule...',
                ),
                CustomButton(
                  onTap: _saveNameToStorage,
                  label: 'Sauvegarder',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _saveNameToStorage() {
    if (_stopwordsController.text.trim().isNotEmpty) {
      final stopwords = _stopwordsController.text.trim();
      _settingsController.saveStopwords(stopwords);
      Get.back();
    } else {
      Get.snackbar(
        'Le champ est vide',
        "Veuillez le remplir",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}