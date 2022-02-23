import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vijanakinyerezi/home/home_page.dart';
import 'package:vijanakinyerezi/onboard/onboard.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';

int? isviewed;

void main() async {
  runApp(const MyApp());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoardApp');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: MyColors.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.primary,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIJANA',
      home: isviewed == 0 ? const OnBoard() : const HomePageScreen(),
      // isviewed == 0 ? const OnBoard() : const HomePageScreen(),
    );
  }
}
