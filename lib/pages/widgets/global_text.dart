import 'package:flutter/material.dart';

Widget globalText({
  required String text,
  required Color textColor,
  required double textFontSize,
  required FontWeight textFontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: textFontSize,
      fontWeight: textFontWeight,
    ),
  );
}
