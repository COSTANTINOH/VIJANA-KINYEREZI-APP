import 'package:flutter/material.dart';

class CustomizedDivider extends StatelessWidget {
  final bool shift;
  final bool full;
  final dynamic bright;

  const CustomizedDivider(
      {Key? key, required this.bright, required this.full, required this.shift})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: bright.brightness == Brightness.dark
          ? Colors.white
          : Colors.grey[200],
      indent: shift || full ? 0 : 50,
      thickness: shift ? 10 : 0,
    );
  }
}

class BottomSeparator extends StatelessWidget {
  const BottomSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(height: 8, color: Colors.grey, width: 50),
      ),
    );
  }
}
