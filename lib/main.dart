import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';
import 'config/router/app_router.dart';
import 'core/get_it/get_it.dart';

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
          create: (_) => LoginBloc(inject(), inject(), inject(), inject())..add(
              CheckLoggedInEvent()
          ),
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
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.blue,
            systemNavigationBarColor: AppColors.blue, // Navigation bar
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
