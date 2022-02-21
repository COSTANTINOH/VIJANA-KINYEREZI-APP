import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void popUpFeedback(BuildContext context,
    {required String message,
    required String title,
    required IconData icon,
    bool error = false,
    Color? colors,
    double? width,
    required position}) {
  showToast(
    message,
    context: context,
    position: position,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 5),
    animationBuilder: (
      BuildContext context,
      AnimationController controller,
      Duration duration,
      Widget child,
    ) {
      return SlideTransition(
        position: getAnimation<Offset>(
          const Offset(0.0, 3.0),
          const Offset(0, 0),
          controller,
          curve: Curves.bounceInOut,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Material(
            child: Container(
              height: 60,
              width: width ?? jtdeviceWidth(context) / 1.5,
              decoration: BoxDecoration(
                color: colors ?? Colors.green,
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 40,
                    ),
                    jtmanualSpacer(step: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: jtdeviceWidth(context) / 25,
                          ),
                        ),
                        jtmanualSpacer(step: 5),
                        Text(
                          message,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: jtdeviceWidth(context) / 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    reverseAnimBuilder: (
      BuildContext context,
      AnimationController controller,
      Duration duration,
      Widget child,
    ) {
      return SlideTransition(
        position: getAnimation<Offset>(
          const Offset(0.0, 0.0),
          const Offset(-3.0, 0),
          controller,
          // curve: Curves.bounceInOut,
        ),
        child: child,
      );
    },
  );
}
