import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/core/widgets/drawer_header.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';

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
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is VerifiedTotpState) {
                return AppDrawerHeader(email: state.email);
              }
              if (state is LoggedInState) {
                return AppDrawerHeader(email: state.email);
              }
              if (state is LoginSuccess) {
                return AppDrawerHeader(email: state.email);
              }
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: AppColors.blue),
                currentAccountPicture: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xFF778899),
                  child: Image.asset(
                    'images/profile.png',
                  ), //For Image Asset
                ),
                accountName: const Text(''),
                accountEmail: const Text(
                  "Bienvenido",
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.gear),
            title: Text(
              'Preferencias',
              style: AppTypography.h3TitleBlack,
            ),
            onTap: () {
              context.go("/settings");
            },
          ),
        ],
      ),
    );
  }
}
