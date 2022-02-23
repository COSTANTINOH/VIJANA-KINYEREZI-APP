// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/auth/screens/auth_land_screen.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';


class NoAuthBanner extends StatelessWidget {
  static String routeName = "/noauth";

  const NoAuthBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: jtdeviceHeight(context) / 20),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                jtmanualSpacer(step: 30),
                SizedBox(
                  height: jtdeviceHeight(context) * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Image.asset('assets/images/lock.png'),
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Access Denied",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "In order to continue you must login to your account.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // DefaultButton(
                      //   text: "Sign",
                      //   press: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      //   },
                      // ),
                      jtmanualStepper(step: 5),
                      // DefaultButton(
                      //   text: "Login",
                      //   press: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                      //   },
                      // ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: MyColors.primary,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomePage()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
