import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/widgets/app_custom_button.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';
import 'package:recruitment/core/widgets/text_input.dart';
import 'package:recruitment/features/news/presentation/bloc/news_bloc.dart';
import 'package:recruitment/features/news/presentation/bloc/news_event.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = "ernestoale97@gmail.com";
    _passwordController.text = "Asdasd321";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextInput(
              controller: _emailController,
              hintText: "Email",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (false) {
                  return 'Please enter a valid E-Mail';
                }
                return null;
              },
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            AppTextInput(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              inputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 15),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                  ));
                }
                if (state is LoginTotpRequired) {
                  context.go("/login/verify-totp");
                }
                if (state is LoginSuccess || state is LoggedInState) {
                  /*newsBloc.add(
                      FetchNewsEvent()
                  );*/
                  context.go("/");
                }
              },
              builder: (context, state) {
                if (state is LoginSending) {
                  return const CircularProgressIndicator();
                }
                return AppCustomButton(
                    onTap: () {
                      loginBloc.add(
                          LoginRequestEvent(
                              loginForm: LoginFormEntity(
                                email: _emailController.text,
                                password: _passwordController.text,
                              )
                          )
                      );
                    },
                    width: MediaQuery.of(context).size.width * 0.87,
                    text: "Sign In",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
