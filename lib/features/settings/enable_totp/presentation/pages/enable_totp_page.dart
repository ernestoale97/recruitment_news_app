import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import '../../../../../service_locator.dart';
import '../bloc/enable_totp_bloc.dart';
import '../widgets/enable_totp_form.dart';

class EnableTotpPage extends StatefulWidget {
  const EnableTotpPage({super.key});

  @override
  State<EnableTotpPage> createState() => _EnableTotpPageState();
}

class _EnableTotpPageState extends State<EnableTotpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EnableTotpBloc>(
      create: (_) => EnableTotpBloc(inject(), inject())..add(GenerateTotpEvent()),
      child: BlocConsumer<EnableTotpBloc, EnableTotpState>(
        listener: (context, state) {
          EnableTotpBloc enableTotpBloc = BlocProvider.of(context);
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
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.blue,
                centerTitle: true,
                leading: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  onPressed: () {
                    context.pop();
                  },
                ),
                title: Text("Activar 2FA", style: AppTypography.h1TitleWhite),
              ),
              body: const Center(
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
              appBar: AppBar(
                backgroundColor: AppColors.blue,
                centerTitle: true,
                leading: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  onPressed: () {
                    context.pop();
                  },
                ),
                title: Text("Activar 2FA", style: AppTypography.h1TitleWhite),
              ),
              body: Center(
                child: Text(state.message),
              ),
            );
          }
          if (state is GeneratedTotpState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.blue,
                centerTitle: true,
                leading: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  onPressed: () {
                    context.pop();
                  },
                ),
                title: Text("Activar 2FA", style: AppTypography.h1TitleWhite),
              ),
              body: Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.2,
                        blurRadius: 2,
                        offset: const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: EnableTotpForm(
                    enableTotpBloc: enableTotpBloc,
                    state: state,
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
