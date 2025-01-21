import 'package:flutter/material.dart';

class Uihelper {
  
   static CustomText(
      {required String text,
      required Color color,
      required FontWeight fontweight,
      required double fontsize}) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontsize, fontWeight: fontweight, color: color),
    );
  }

}
