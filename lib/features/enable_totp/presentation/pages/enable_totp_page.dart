import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/features/enable_totp/presentation/bloc/enable_totp_bloc.dart';

import '../../../../core/get_it/get_it.dart';

class EnableTotpPage extends StatefulWidget {
  const EnableTotpPage({super.key});

  @override
  State<EnableTotpPage> createState() => _EnableTotpPageState();
}

class _EnableTotpPageState extends State<EnableTotpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EnableTotpBloc>(
      create: (_) => EnableTotpBloc(inject())..add(GenerateTotpEvent()),
      child: BlocConsumer<EnableTotpBloc, EnableTotpState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GeneratingTotpState) {
            return const CircularProgressIndicator();
          }
          if (state is GeneratedTotpState) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Por favor escanee el siguiente codigo QR con la aplicacion Google Authenticator o agregalo manualmente utilizando el codigo:", textAlign: TextAlign.justify),
                      Text(state.data.secret, style: AppTypography.h3TitleBlack,),
                      const Text("y luego verifiquelo utilizando el codigo generado"),
                      Center(child: Image.memory(base64Decode(state.data.qr)),),
                      SizedBox(height: 20),
                      Text("Code (requerido)", style: AppTypography.headerSmall),
                      const Text("Aqui el input"),
                      MaterialButton(
                        color: AppColors.blue,
                        onPressed: (){},
                        child: Text("Validar"),
                      )
                    ],
                  ),
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
          return const Scaffold(
            body: SizedBox(height: 0),
          );
        },
      ),
    );
  }
}
