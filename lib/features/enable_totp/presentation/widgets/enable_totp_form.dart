import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../core/resources/typography.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/text_input.dart';
import '../bloc/enable_totp_bloc.dart';

class EnableTotpForm extends StatefulWidget {
  final GeneratedTotpState _state;
  final EnableTotpBloc _enableTotpBloc;
  const EnableTotpForm({super.key, required EnableTotpBloc enableTotpBloc, required GeneratedTotpState state}) : _enableTotpBloc = enableTotpBloc, _state = state;

  @override
  State<EnableTotpForm> createState() => _EnableTotpFormState();
}

class _EnableTotpFormState extends State<EnableTotpForm> {
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Por favor escanee el siguiente código QR con la aplicación Google Authenticator o agreguelo manualmente a través de la clave:", textAlign: TextAlign.justify),
              const SizedBox(height: 10),
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () async {
                      Clipboard.setData(ClipboardData(text: widget._state.data.secret)).whenComplete(() {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Copiado al portapapeles"),
                        ));
                      });
                    },
                    child: Text(widget._state.data.secret, style: AppTypography.h3TitleBlack, textAlign: TextAlign.center),
                  );
                },
              ),
              const SizedBox(height: 10),
              Center(child: Image.memory(base64Decode(widget._state.data.qr)),),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Código generado", style: AppTypography.headerSmall),
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
                onChanged: (value) {
                },
                validator: (value) {
                  return null;
                },
                inputFormatters: [maskFormatter],
              ),
              const SizedBox(height: 20),
              AppCustomButton(
                onTap: () {
                  String totp = maskFormatter.getUnmaskedText();
                  if (totp.length == 6) {
                    widget._enableTotpBloc.add(
                        ActivateTotpEvent(
                          totp: totp,
                        )
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("El código debe contener 6 dígitos"),
                    ));
                  }
                },
                text: "Verificar",
                width: width * 0.9,
              )
            ],
          ),
        ),
      ),
    );
  }
}
