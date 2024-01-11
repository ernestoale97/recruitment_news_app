import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/core/widgets/text_input.dart';
import 'package:recruitment/features/enable_totp/presentation/bloc/enable_totp_bloc.dart';
import 'package:recruitment/features/news/presentation/widgets/button.dart';

import '../../../../core/get_it/get_it.dart';
import '../../../../core/widgets/app_custom_button.dart';

class EnableTotpPage extends StatefulWidget {
  const EnableTotpPage({super.key});

  @override
  State<EnableTotpPage> createState() => _EnableTotpPageState();
}

class _EnableTotpPageState extends State<EnableTotpPage> {
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
    return BlocProvider<EnableTotpBloc>(
      create: (_) => EnableTotpBloc(inject())..add(GenerateTotpEvent()),
      child: BlocConsumer<EnableTotpBloc, EnableTotpState>(
        listener: (context, state) {
          EnableTotpBloc enableTotpBloc = BlocProvider.of(context);
          _totpController.clear();
          if (state is ActivateTotpFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
            enableTotpBloc.add(
                GenerateTotpEvent()
            );
          }
          if (state is ActivatedTotpState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("El 2FA ha sido correctamente activado para su cuenta."),
            ));
            context.pop();
          }
        },
        builder: (context, state) {
          EnableTotpBloc enableTotpBloc = BlocProvider.of(context);
          if (state is GeneratingTotpState) {
            return const Scaffold(
              body: Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (state is GenerateTotpFailedState) {
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
          }
          if (state is GeneratedTotpState) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Por favor escanee el siguiente código QR con la aplicación Google Authenticator o agrégalo manualmente utilizando el código:", textAlign: TextAlign.justify),
                          const SizedBox(height: 10),
                          Text(state.data.secret, style: AppTypography.h3TitleBlack, textAlign: TextAlign.center),
                          const SizedBox(height: 10),
                          const Text("y luego verifíquelo utilizando el código generado"),
                          Center(child: Image.memory(base64Decode(state.data.qr)),),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text("Código", style: AppTypography.headerSmall),
                              const SizedBox(width: 5),
                              Text("(requerido)", style: AppTypography.smallSubtitle),
                            ],
                          ),
                          const SizedBox(height: 10),
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
                          AppCustomButton(
                            onTap: () {
                              String totp = maskFormatter.getUnmaskedText();
                              if (totp.length == 6) {}
                              enableTotpBloc.add(
                                  ActivateTotpEvent(
                                    totp: maskFormatter.getUnmaskedText(),
                                  )
                              );
                            },
                            text: "Verificar",
                            width: width * 0.9,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: SizedBox(height: 0),
          );
        },
      ),
    );
  }
}
