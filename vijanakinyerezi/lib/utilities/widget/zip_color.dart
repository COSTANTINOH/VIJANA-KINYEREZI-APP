import 'dart:convert';
import 'package:flutter/material.dart';

class Utility {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String getBase64EncodedString(String text) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(text.trim());
  }

  static String getBase64DecodedString(String text) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.decode(text.trim());
  }

  static String getFileExtension(String link) {
    String ext = "mp4";
    if (link.contains(".")) {
      ext = link.substring(link.lastIndexOf("."));
    }
    return ext.replaceAll(".", "");
  }
}
