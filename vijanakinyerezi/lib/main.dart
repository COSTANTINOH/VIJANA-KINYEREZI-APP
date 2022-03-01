import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vijanakinyerezi/home/home_page.dart';
import 'package:vijanakinyerezi/onboard/onboard.dart';

int? isviewed;

void main() async {
  runApp(const MyApp());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoardApp');
  if (isviewed == null) {
    prefs.setInt('onBoardApp', 0);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("value $isviewed");
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).primaryColor.withOpacity(1),
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).primaryColor.withOpacity(1),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIJANA',
      home: isviewed == 0 ? const OnBoard() : const HomePageScreen(),
    );
  }
}
