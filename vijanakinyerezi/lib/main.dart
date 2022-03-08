import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vijanakinyerezi/home/home_page.dart';
import 'package:vijanakinyerezi/onboard/onboard.dart';
import 'package:vijanakinyerezi/utilities/constants/constant.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';

import 'utilities/localstorage/shared/local_storage.dart';

int? isviewed;

void main() async {
  runApp(const MyApp());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoardApp');
  if (isviewed == null) {
    prefs.setInt('onBoardApp', 0);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    LocalStorage.getStringItem('mydata').then((value) {
      if (value.isNotEmpty) {
        var mydata = jsonDecode(value);
        String access = jsonEncode(mydata);

        setState(() {
          data = mydata;
          accessToken = access;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: MyColors.primary, //Theme.of(context).primaryColor.withOpacity(1),
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.primary, //Theme.of(context).primaryColor.withOpacity(1),
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
