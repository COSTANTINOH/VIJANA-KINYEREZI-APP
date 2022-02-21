import 'package:flutter/material.dart';

void jBBottomWidget(
  BuildContext context, {
  required Color backgroundColor,
  double elevation = 10,
  bool scrollable = false,
  required Widget child,
  bool dismiss = true,
  double radiusLeft = 12,
  double radiusRight = 12,
}) {
  showModalBottomSheet(
    elevation: elevation,
    isDismissible: dismiss,
    isScrollControlled: scrollable,
    backgroundColor: Theme.of(context).cardTheme.color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radiusLeft),
        topRight: Radius.circular(radiusRight),
      ),
    ),
    context: context,
    builder: (context) {
      return child;
    },
  );
}
