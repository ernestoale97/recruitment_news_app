import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/signup/presentation/bloc/signup_bloc.dart';

import '../../../../core/widgets/app_custom_button.dart';
import '../../../../core/widgets/text_input.dart';
import '../../domain/entities/signup_form.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = UniqueKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SignupBloc signupBloc = BlocProvider.of(context);
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
              hintText: "Correo electronico",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor introduzca su correo';
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
              hintText: "Contraseña",
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Repetir contraseña';
                }
                return null;
              },
              inputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 15),
            AppTextInput(
              controller: _passwordRepeatController,
              hintText: "Repetir contraseña",
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor introduzca su contraseña';
                }
                return null;
              },
              inputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 15),
            BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                  ));
                }
                if (state is SignupDoneState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Registro completado. Ahora puede iniciar sesion"),
                  ));
                  context.pop();
                }
              },
              builder: (context, state) {
                if (state is SignupOnProcessState) {
                  return const CircularProgressIndicator();
                }
                return AppCustomButton(
                  onTap: () {
                    if (_passwordController.text != _passwordRepeatController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Las contraseñas deben ser iguales"),
                      ));
                      return;
                    }
                    if (_passwordController.text.isEmpty || _emailController.text.isEmpty || _passwordRepeatController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Debe llenar todos los campos"),
                      ));
                      return;
                    }
                    signupBloc.add(
                        SignupRequestEvent(
                            SignupFormEntity(
                              email: _emailController.text,
                              password: _passwordController.text,
                            )
                        )
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.87,
                  text: "Registrar",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
