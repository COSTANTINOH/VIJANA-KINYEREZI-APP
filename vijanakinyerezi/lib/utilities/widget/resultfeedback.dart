
import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/constants/constant.dart';
import 'package:vijanakinyerezi/utilities/widget/index.dart';

class ResultFeedback extends StatelessWidget {
  final bool error;
  final Function tryAgain;
  final double height;
  final double width;
  final bool showButton;
  final bool session;
  final String customLabel;
  final bool showIndicator;
  final Color color;
  final double buttonWidth;
  final Widget child;

  const ResultFeedback({
    Key? key,
    this.error = false,
    this.showIndicator = true,
    this.session = false,
    required this.tryAgain,
    required this.height,
    required this.width,
    required this.customLabel,
    this.showButton = false,
    required this.color,
    required this.buttonWidth,
    required this.child,
  }) : super(key: key);
  final _align = TextAlign.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: !showIndicator
          ? jtmanualStepper()
          : SizedBox(
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (error || session)
                      ? Image.asset(
                          'assets/images/error.png',
                          fit: BoxFit.scaleDown,
                          height: jtdeviceHeight(context) / 10,
                        )
                      : const CircularProgressIndicator(),
                  jtmanualStepper(step: 20),
                  Text(
                    error
                        ? customLabel
                        : session
                            ? 'error'
                            : customLabel,
                    textAlign: _align,
                    textScaleFactor: textScaleFactor,
                    style: TextStyle(
                      fontSize: jtdeviceWidth(context) / 30,
                    ),
                  ),
                  jtmanualStepper(step: 10),
                  session
                      ? JTButtons(
                          action: () => {},
                          buttonColor: color,
                          buttonWidth: buttonWidth,
                          child: child,
                        )
                      : jtmanualStepper(step: 0),
                  (error && showButton)
                      ? JTButtons(
                          action: () => tryAgain(),
                          buttonColor: color,
                          buttonWidth: buttonWidth,
                          child: child,
                        )
                      : jtmanualStepper(step: 0)
                ],
              ),
            ),
    );
  }
}
