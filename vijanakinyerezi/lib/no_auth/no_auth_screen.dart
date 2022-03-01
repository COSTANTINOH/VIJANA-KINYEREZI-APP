import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:vijanakinyerezi/auth/screens/login_screen.dart';
import 'package:vijanakinyerezi/auth/screens/register_screen.dart';
import 'package:vijanakinyerezi/utilities/constants/constant.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';
import 'package:vijanakinyerezi/utilities/widget/index.dart';

List<dynamic> countries = [];

class NoAuthScreen extends StatefulWidget {
  const NoAuthScreen({Key? key}) : super(key: key);

  @override
  State<NoAuthScreen> createState() => _NoAuthScreenState();
}

class _NoAuthScreenState extends State<NoAuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final _bright = context.watch<ThemeBloc>();
    HapticFeedback.lightImpact();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "UMEZUILIWA KUINGIA",
                      textScaleFactor: textScaleFactor,
                      style: const TextStyle(fontSize: 21),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Jisajili au Ingia kuendelea...",
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                jtmanualStepper(step: 20),
                JTButtons(
                  buttonHeight: 53,
                  radius: 5,
                  action: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        barrierDismissible: true,
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (BuildContext context, animation, __) {
                          return FadeTransition(
                            opacity: animation,
                            child: const LoginPage(),
                          );
                        },
                      ),
                    );
                  },
                  buttonColor: MyColors.primary,
                  child: const Text(
                    "ingia",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  buttonWidth: jtdeviceWidth(context) * 0.8,
                ),
                jtmanualStepper(step: 20),
                JTButtons(
                  elevation: 0,
                  buttonHeight: 53,
                  radius: 5,
                  action: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        barrierDismissible: true,
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (BuildContext context, animation, __) {
                          return FadeTransition(
                            opacity: animation,
                            child: const SignUpPage(),
                          );
                        },
                      ),
                    );
                  },
                  color: const Color.fromRGBO(255, 129, 55, 0.2),
                  buttonColor: const Color.fromRGBO(255, 129, 55, 0.2),
                  child: Text(
                    "Jisajili",
                    style: TextStyle(
                      color: MyColors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  buttonWidth: jtdeviceWidth(context) * 0.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
