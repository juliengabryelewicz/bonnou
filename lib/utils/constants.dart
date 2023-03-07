import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyleBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
    ),
  );
}

TextStyle textStyleBoldGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle textStyleBoldBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle textStyleBoldBlue(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget verticalSpace(double height) => SizedBox(height: height);
