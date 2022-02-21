import 'package:flutter/material.dart';

class JTButtons extends StatelessWidget {
  final double radius;
  final VoidCallback action;
  final double scale;
  final Widget child;
  final FontWeight weight;
  final double elevation;
  final double size;
  final Color color;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final double spacing;

  const JTButtons({
    Key? key,
    required this.action,
    this.radius = 5.0,
    this.elevation = 0,
    required this.buttonColor,
    this.spacing = 1,
    required this.child,
    this.buttonHeight = 40,
    required this.buttonWidth,
    this.color = Colors.white,
    this.size = 12,
    this.scale = 1,
    this.weight = FontWeight.bold,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        // shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(radius)
        // ),
        key: key,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            elevation: elevation,
            primary: buttonColor),
        onPressed: () => action(),
        child: child,
      ),
    );
  }
}

class JBButtonsColor extends StatelessWidget {
  final Color shadow;
  final VoidCallback action;
  final double radius;
  final Widget? child;
  final String label;
  final double scale;
  final Color splash;
  final FontWeight weight;
  final double elevation;
  final double size;
  final Color color;
  final double buttonHeight;
  final double buttonWidth;
  final double spacing;
  const JBButtonsColor({
    Key? key,
    required this.action,
    required this.shadow,
    this.elevation = 2,
    this.radius = 30,
    this.child,
    this.spacing = 1,
    this.splash = Colors.white12,
    this.buttonHeight = 50,
    required this.buttonWidth,
    this.color = Colors.white,
    this.size = 12,
    this.scale = 1,
    this.weight = FontWeight.bold,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              80.0,
            ),
          ),
          elevation: elevation,
          padding: const EdgeInsets.all(0.0),
        ),
        onPressed: () => action(),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: buttonHeight,
              maxWidth: buttonWidth,
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}

class JBButtonsFlat extends StatelessWidget {
  final ValueKey valueKey;
  final VoidCallback pressed;
  final Color color;
  final String label;
  final double scale;
  final Widget child;
  final TextStyle style;
  final ButtonStyle buttonStyle;
  final double buttonWidth;
  final double buttonHeight;

  final BorderSide side;
  final double elevation;

  final ShapeBorder shape;

  const JBButtonsFlat({
    Key? key,
    required this.pressed,
    required this.style,
    required this.elevation,
    required this.buttonWidth,
    required this.side,
    required this.child,
    required this.buttonHeight,
    required this.buttonStyle,
    required this.valueKey,
    this.scale = 1,
    required this.color,
    required this.shape,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
          key: valueKey,
          style: TextButton.styleFrom(
            // shape: shape,
            backgroundColor: color,
            side: side,
            elevation: elevation,
          ),
          onPressed: () => pressed(),
          child: child),
    );
  }
}
