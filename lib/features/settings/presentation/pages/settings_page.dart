import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/settings/presentation/widgets/settings_tile.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text("Preferencias", style: AppTypography.h1TitleWhite),
      ),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ScrollPhysics(),
              children: [
                SettingsTile(
                  title: "Activar 2FA",
                  subtitle: "Segundo factor de autenticacion",
                  onTap: () {
                    context.go("/settings/activate_totp");
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
