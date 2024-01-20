import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
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
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.newspaper, size: 40),
                    const SizedBox(width: 10),
                    Text("News", style: AppTypography.h1TitleBlack)
                  ],
                ),
                const LoginForm(),
                Text("- O -", style: AppTypography.h3TitleBlack),
                GestureDetector(
                  onTap: () {
                    context.go("/login/signup");
                  },
                  child: Text(
                    'Crea una nueva cuenta',
                    textAlign: TextAlign.center,
                    style: AppTypography.h3TitleBlack,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
