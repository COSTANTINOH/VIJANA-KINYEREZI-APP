import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';

class Alerts {
  static Future<void> show(context, title, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Kubali"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showProgressDialog(BuildContext context, String title) {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AlertDialog(
                content: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Flexible(
                      flex: 8,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    } catch (e) {
      log(e.toString());
    }
  }

  static logout({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String btn1,
    required String btn2,
    required Widget child,
    required Function() buttonPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          // buttonPadding: const EdgeInsets.only(
          //   left: 48,
          //   right: 48,
          // ),
          title: Column(
            children: [
              Icon(
                Icons.info,
                size: 55,
                color: MyColors.primary,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 21,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          content: Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
          actionsPadding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                side: const BorderSide(width: 1, color: MyColors.jatuGrey),
              ),
              child: Text(
                btn1,
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
                // side: const BorderSide(width: 1, color: Colors.green),
              ),
              child: Text(
                btn2,
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
              onPressed: buttonPressed,
            )
          ],
        );
      },
    );
  }

  static showPlaySubscribeAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Aujalipia"),
          content: const Text("Unatakiwa uwe umeingia kwenye akauinti yako"),
          actions: <Widget>[
            TextButton(
              child: const Text("Funga"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Jiunge"),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pushNamed(context, SubscriptionScreen.routeName);
              },
            )
          ],
        );
      },
    );
  }

  static showPreviewSubscribeAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Subscribe"),
          content: const Text("Jiunge"),
          actions: <Widget>[
            TextButton(
              child: const Text("Funga"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Jiunge"),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pushNamed(context, SubscriptionScreen.routeName);
              },
            )
          ],
        );
      },
    );
  }
}
