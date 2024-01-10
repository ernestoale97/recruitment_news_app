import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';
import 'package:recruitment/features/news/presentation/bloc/news_event.dart';

import 'config/router/app_router.dart';
import 'core/get_it/get_it.dart';
import 'features/news/presentation/bloc/news_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(inject())..add(CheckLoggedInEvent()),
        ),
        BlocProvider<NewsBloc>(
          create: (_) => NewsBloc(inject()),
        ),
      ], child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
