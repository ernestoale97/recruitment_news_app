import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.faceSmile),
            title: Text('Profile', style: AppTypography.h2TitleBlack,),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.gear),
            title: Text('Settings', style: AppTypography.h2TitleBlack,),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
