import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.newspaper),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bell),
          label: 'Updates',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.faceSmile),
          label: 'Profile',
        ),
      ],
    );
  }
}
