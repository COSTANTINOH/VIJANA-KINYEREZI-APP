import 'package:flutter/material.dart';

PageRouteBuilder routeAnimation(BuildContext context, {required Widget widget, String? analytic}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secAnimation) => widget,
    settings: RouteSettings(name: analytic),
    transitionsBuilder: (context, animation, secAnimation, child) => child,
  );
}
