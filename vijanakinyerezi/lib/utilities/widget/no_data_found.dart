import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';

class NoDataFound extends StatelessWidget {
  final double height;
  final double width;
  final double animHeight;
  final String title;

  const NoDataFound(
      {Key? key, required this.height, required this.width, required this.animHeight, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SizedBox(
        height: jtdeviceHeight(context) * animHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animation/no_data.json',
                  height: 200,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
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
