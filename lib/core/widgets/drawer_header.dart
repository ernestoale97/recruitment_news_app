import 'package:flutter/material.dart';
import 'package:recruitment/core/resources/typography.dart';

import '../resources/colors.dart';

class AppDrawerHeader extends StatelessWidget {
  final String email;
  const AppDrawerHeader({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: AppColors.blue),
      currentAccountPicture:  CircleAvatar(
        radius: 60.0,
        backgroundColor: const Color(0xFF778899),
        child: Image.asset(
          'assets/images/no_image_profile.png',
        ),
      ),
      accountName: const Text(''),
      accountEmail: Text(
        email,
        style: AppTypography.h3TitleWhite,
      ),
    );;
  }
}
