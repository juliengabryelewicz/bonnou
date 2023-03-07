import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/controllers/rss_controller.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/routes/routes.dart';
import 'package:bonnou/widgets/common/custom_text_field.dart';
import 'package:bonnou/widgets/common/custom_button.dart';
import 'package:bonnou/widgets/create_rss/create_rss_header.dart';

class CreateRssPage extends StatelessWidget {
  CreateRssPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final RssController _rssController = Get.put(RssController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateRssHeader(
                onSaved: _validateTextTitleDescription,
              ),
              verticalSpace(30),
              CustomTextField(
                controller: _titleController,
                label: 'titre',
                hintText: 'titre',
              ),
              CustomTextField(
                controller: _linkController,
                label: 'lien URL',
                hintText: 'lien',
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateTextTitleDescription() {
    if (_titleController.text.isNotEmpty &&
        _linkController.text.isNotEmpty) {
      _createRss();
    } else {
      Get.defaultDialog(
        title: 'Champs vides',
        middleText: 'Les champs sont obligatoires',
        titleStyle: textStyleBoldBlack(24),
        cancel: CustomButton(
          onTap: () => Get.back(),
          label: 'Ok',
          color: Colors.red.withOpacity(0.3),
        ),
        backgroundColor: Colors.blue,
      );
    }
  }

  _createRss() async {
    final String title = _titleController.text;
    final String link = _linkController.text;
    _rssController.addRss(title, link).then((value) {
      Get.snackbar(
        'Lien RSS sauvegardé',
        'Sauvegarde réussie',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed(MyRoutes.getAllRssPageRoute());
    });
  }

}