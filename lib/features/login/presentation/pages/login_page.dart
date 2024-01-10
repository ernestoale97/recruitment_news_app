import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Container(
            width: 428,
            height: 926,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: AppTypography.h1TitleBlack,
                ),
                Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: AppTypography.h3TitleBlack,
                  maxLines: 9999,
                  overflow: TextOverflow.ellipsis,
                ),
                const LoginForm(),
                const Text("- OR -"),
                const Text(
                  'Create new account',
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xff494949), fontFamily: 'Poppins-SemiBold', fontWeight: FontWeight.normal),
                  maxLines: 9999,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        )
    );
  }
}
