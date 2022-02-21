import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/constants/constant.dart';
import 'package:vijanakinyerezi/utilities/widget/index.dart';

void jtshowPopDialog(BuildContext context,
    {required String title,
    required Widget body,
    bool dismiss = false,
    bool showSecondButton = true,
    bool showThirdButton = false,
    required String thirdButtonLabel,
    required Function thirdButtonPressed,
    required Function buttonPressed,
    required String buttonLabel,
    required Color colors,
    required double elevation,
    required double buttonWidth,
    required double buttonHeight,
    required ValueKey valueKey,
    required ButtonStyle buttonStyle,
    required TextStyle style,
    required BorderSide borderSide,
    required ShapeBorder shapeBorder,
    required GlobalKey key}) {
  showDialog(
      context: context,
      barrierDismissible: dismiss,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title,
            textScaleFactor: textScaleFactor,
          ),
          content: body,
          actions: showThirdButton
              ? [
                  JBButtonsFlat(
                    child: Text(
                      "close",
                      textScaleFactor: textScaleFactor,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    pressed: () => Navigator.pop(context),
                    buttonHeight: buttonHeight,
                    buttonWidth: buttonWidth,
                    color: colors,
                    valueKey: valueKey,
                    buttonStyle: buttonStyle,
                    elevation: elevation,
                    label: '',
                    side: borderSide,
                    shape: shapeBorder,
                    style: style,
                  ),
                  JBButtonsFlat(
                    child: Text(
                      buttonLabel,
                      textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline4!.color),
                    ),
                    pressed: () => buttonPressed(),
                    buttonHeight: buttonHeight,
                    buttonWidth: buttonWidth,
                    color: colors,
                    valueKey: valueKey,
                    buttonStyle: buttonStyle,
                    elevation: elevation,
                    label: '',
                    side: borderSide,
                    shape: shapeBorder,
                    style: style,
                  ),
                  JBButtonsFlat(
                    child: Text(
                      thirdButtonLabel,
                      textScaleFactor: textScaleFactor,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline4!.color,
                      ),
                    ),
                    pressed: () => thirdButtonPressed(),
                    buttonHeight: buttonHeight,
                    buttonWidth: buttonWidth,
                    color: colors,
                    valueKey: valueKey,
                    buttonStyle: buttonStyle,
                    elevation: elevation,
                    label: '',
                    side: borderSide,
                    shape: shapeBorder,
                    style: style,
                  )
                ]
              : showSecondButton
                  ? [
                      JBButtonsFlat(
                        child: Text(
                          "close",
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(color: Colors.red),
                        ),
                        pressed: () => Navigator.pop(context),
                        buttonHeight: buttonHeight,
                        buttonWidth: buttonWidth,
                        color: colors,
                        valueKey: valueKey,
                        buttonStyle: buttonStyle,
                        elevation: elevation,
                        label: '',
                        side: borderSide,
                        shape: shapeBorder,
                        style: style,
                      ),
                      JBButtonsFlat(
                        child: Text(
                          buttonLabel,
                          textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline4!.color),
                        ),
                        pressed: () => buttonPressed(),
                        buttonHeight: buttonHeight,
                        buttonWidth: buttonWidth,
                        color: colors,
                        valueKey: valueKey,
                        buttonStyle: buttonStyle,
                        elevation: elevation,
                        label: '',
                        side: borderSide,
                        shape: shapeBorder,
                        style: style,
                      )
                    ]
                  : [
                      JBButtonsFlat(
                        child: Text(
                          "close",
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(color: Colors.red),
                        ),
                        pressed: () => Navigator.pop(context),
                        buttonHeight: buttonHeight,
                        buttonWidth: buttonWidth,
                        color: colors,
                        valueKey: valueKey,
                        buttonStyle: buttonStyle,
                        elevation: elevation,
                        label: '',
                        side: borderSide,
                        shape: shapeBorder,
                        style: style,
                      )
                    ],
        );
      });
}
