import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/controllers/rss_controller.dart';
import 'package:bonnou/models/rss_model.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/routes/routes.dart';
import 'package:bonnou/widgets/common/custom_text_field.dart';
import 'package:bonnou/widgets/common/custom_button.dart';
import 'package:bonnou/widgets/update_rss/update_rss_header.dart';

class UpdateRssPage extends StatelessWidget {
  UpdateRssPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final RssController _rssController = Get.put(RssController());
  final rss = Get.arguments['rss'] as RssModel;

  @override
  Widget build(BuildContext context) {
    _titleController.text = rss.title!;
    _linkController.text = rss.link!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpdateRssHeader(
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
                label: 'lien',
                hintText: 'lien',
              ),
              CustomButton(
                label: 'Supprimer',
                color: Colors.red.withOpacity(0.3),
                onTap: () {
                  _rssController.delete(rss);
                  Get.back();
                },
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
      _updateRss();
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

  _updateRss() async {
    final String title = _titleController.text;
    final String link = _linkController.text;
    final int id = rss.id!;
    _rssController.updateRss(id, title, link).then((value) {
      Get.snackbar(
        'Lien RSS modifié',
        'Mise à jour réussie',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed(MyRoutes.getAllRssPageRoute());
    });
  }

}