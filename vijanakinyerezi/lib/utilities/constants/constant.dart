import 'package:flutter/material.dart';

double textScaleFactor = 1;

String oauth = "oauth/";
String apiV1 = "api/v1/";

String accessToken = '';
Color darkModeColorFeedback(bright, context) {
  return bright.brightness == Brightness.dark ? const Color(0xffa34100) : const Color(0xff003c27);
}

Color darkModeColorPopDialog(bright, context) {
  return bright.brightness == Brightness.dark ? const Color(0xffffaf62) : const Color(0xff003c27);
}
