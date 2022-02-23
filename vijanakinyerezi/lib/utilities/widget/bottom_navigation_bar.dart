import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageButtonNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const HomePageButtonNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: "Mwanzo",
          icon: Icon(FontAwesomeIcons.home),
        ),
        BottomNavigationBarItem(
          label: "Habari",
          icon: Icon(FontAwesomeIcons.newspaper),
        ),
        BottomNavigationBarItem(
          label: "Mfuko",
          icon: Icon(null),
        ),
        BottomNavigationBarItem(
          label: "Vijana",
          icon: Icon(FontAwesomeIcons.users),
        ),
        BottomNavigationBarItem(
          label: "Akaunti",
          icon: Icon(FontAwesomeIcons.user),
        ),
      ],
    );
  }
}
