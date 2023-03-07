import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';

class DisplayAbout extends StatelessWidget {
  const DisplayAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bonnou est un lecteur RSS expérimental dont le but est de sélectionner au mieux les bonnes nouvelles via l'Intelligence Artificielle.",
            style: textStyleBlack(16),
          ),
          verticalSpace(16),
          Text(
            "Il se sert pour le moment d'un modèle TensorFlow entraîné avec des critiques venant du site Allociné. Un autre modèle est en cours d'écriture pour mieux répondre à l'objectif.",
            style: textStyleBlack(16),
          ),
          verticalSpace(16),
          Text(
            "Au cas où certaines nouvelles sont visibles, il est possible de filtrer en ajoutant des mots dans les paramètres.",
            style: textStyleBlack(16),
          ),
        ],
      ),
    );
  }
}