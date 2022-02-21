import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vijanakinyerezi/utilities/constants/constant.dart';
import 'package:vijanakinyerezi/utilities/state/theme.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';

class Titles extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  final double spacing;
  final String family;
  final GlobalKey globalKey;

  const Titles(
    this.data, {
    Key? key,
    this.color = Colors.black,
    required this.globalKey,
    required this.size,
    this.spacing = 1,
    required this.family,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      key: key,
      textScaleFactor: 1,
      style: (jtdeviceHeight(context) < 740)
          ? TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size,
            )
          : Theme.of(context).textTheme.headline6,
    );
  }
}

class RichTexts extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final double size;
  final Color color;
  final double spacing;
  final String family;
  final GlobalKey globalKey;

  const RichTexts(
    this.text1,
    this.text2,
    this.text3, {
    Key? key,
    this.color = Colors.black,
    required this.globalKey,
    required this.size,
    this.spacing = 1,
    required this.family,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: (jtdeviceHeight(context) < 740)
            ? TextStyle(fontWeight: FontWeight.bold, fontSize: size)
            : Theme.of(context).textTheme.headline6,
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              color: color,
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              color: color,
            ),
          ),
          TextSpan(
            text: text3,
          )
        ],
      ),
      textScaleFactor: 1,
    );
  }
}

//short text with bold
class TextShort extends StatelessWidget {
  final String data;
  final double size;
  final Color color;

  final double spacing;
  final String family;
  final TextAlign align;

  const TextShort(
    this.data, {
    Key? key,
    required this.color,
    this.size = 10,
    this.spacing = 1,
    required this.family,
    required this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textScaleFactor: 1,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
        letterSpacing: spacing,
      ),
    );
  }
}

class JTRichText extends StatelessWidget {
  final String titleName;
  final Color titleColor;
  final String titleValue;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  const JTRichText({
    Key? key,
    required this.titleName,
    required this.titleValue,
    required this.fontWeight,
    required this.titleColor,
    required this.color,
    required this.fontSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeBloc>(
      builder: (_, ThemeBloc bloc, child) {
        return RichText(
          textScaleFactor: textScaleFactor,
          text: TextSpan(
            text: titleName,
            style: TextStyle(color: bloc.brightness == Brightness.light ? Colors.black : titleColor),
            children: [
              TextSpan(
                text: titleValue,
                style: TextStyle(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class AppTitles extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  final double spacing;
  final String family;

  ///normal title used over all the app's intents'
  const AppTitles(
    this.data, {
    this.color = Colors.black,
    required this.size,
    this.spacing = 1,
    required this.family,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      key: key,
      textScaleFactor: 1,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        fontFamily: family,
      ),
    );
  }
}
