import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback action;

  const NoInternet({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/no_internet.svg'),
          const Text(
            'Couldn’t connect to internet \n Please check your network settings.',
            textAlign: TextAlign.center,
          ),
          jtmanualStepper(),
          TextButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: action,
            child: const Text('Try Again'),
          )
        ],
      ),
    );
  }
}
