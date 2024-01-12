import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/news/presentation/bloc/news_event.dart';

import '../get_it/get_it.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/news/domain/repositories/articles_repository.dart';
import '../../features/news/presentation/bloc/news_bloc.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final NewsBloc newsBloc = BlocProvider.of(context);
    final LoginBloc loginBloc = BlocProvider.of(context);
    return BottomNavigationBar(
      onTap: (index) {
        if(index == 0) {
          newsBloc.add(
            FetchNewsEvent(),
          );
        }
        if(index == 2) {
          loginBloc.add(
              LogoutRequestEvent()
          );
          context.go("/login");
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.newspaper),
          label: 'Noticias',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bell),
          label: 'Novedades',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.doorOpen),
          label: 'Desconectar',
        ),
      ],
    );
  }
}
