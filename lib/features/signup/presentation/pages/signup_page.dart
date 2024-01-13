import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/service_locator.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:recruitment/features/signup/presentation/widgets/signup_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: BlocProvider(
          create: (_) => SignupBloc(inject()),
          child: Container(
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
                    'Registrarse',
                    textAlign: TextAlign.center,
                    style: AppTypography.h1TitleBlack,
                  ),
                  /*Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: AppTypography.h3TitleBlack,
                  maxLines: 9999,
                  overflow: TextOverflow.ellipsis,
                ),*/
                  const SignupForm(),
                ],
              ),
            ),
          ),
        )
    );
  }
}
