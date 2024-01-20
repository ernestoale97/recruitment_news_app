import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';

import '../../../../core/widgets/app_custom_button.dart';
import '../../../../core/widgets/text_input.dart';

class TotpVerifyPage extends StatefulWidget {
  const TotpVerifyPage({super.key});

  @override
  State<TotpVerifyPage> createState() => _TotpVerifyPageState();
}

class _TotpVerifyPageState extends State<TotpVerifyPage> {
  final _formKey = UniqueKey();
  final _totpController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
      mask: '### ###',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Verificar 2FA',
                      textAlign: TextAlign.center,
                      style: AppTypography.h1TitleBlack,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Introduzca el codigo',
                      textAlign: TextAlign.center,
                      style: AppTypography.h3TitleBlack,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    AppTextInput(
                      controller: _totpController,
                      inputType: TextInputType.number,
                      textAlign: TextAlign.center,
                      hintText: "000 000",
                      validator: (value) {
                        return null;
                      },
                      inputFormatters: [maskFormatter],
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (BuildContext context, LoginState state) {
                        _totpController.clear();
                        if (state is VerifyFailTotpState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                          ));
                        }
                        if (state is VerifiedTotpState) {
                          context.go("/");
                        }
                      },
                      builder: (BuildContext context, LoginState state) {
                        LoginBloc loginBloc = BlocProvider.of(context);
                        return AppCustomButton(
                          onTap: () {
                            String totp = maskFormatter.getUnmaskedText();
                            if (totp.length == 6) {
                              loginBloc.add(
                                  VerifyTotpRequestEvent(
                                      totp: int.parse(totp)
                                  )
                              );
                            }
                          },
                          text: "Verificar",
                          width: width * 0.9,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
