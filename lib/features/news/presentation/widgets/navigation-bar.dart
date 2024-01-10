import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recruitment/features/news/presentation/bloc/news_event.dart';

import '../../../../core/get_it/get_it.dart';
import '../../domain/repositories/articles_repository.dart';
import '../bloc/news_bloc.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final NewsBloc newsBloc = BlocProvider.of(context);
    return BottomNavigationBar(
      onTap: (index) {
        if(index == 0) {
          newsBloc.add(
            FetchNewsEvent(),
          );
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.newspaper),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bell),
          label: 'Updates',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.faceSmile),
          label: 'Profile',
        ),
      ],
    );
  }
}
