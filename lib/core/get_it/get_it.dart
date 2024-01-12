import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:recruitment/features/login/data/data_sources/local/local_login_data_source.dart';
import 'package:recruitment/features/login/data/data_sources/remote/remote_login_data_source.dart';
import 'package:recruitment/features/login/data/repositories/login_repository_impl.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';
import 'package:recruitment/features/login/domain/use_cases/check_logged_in_usecase.dart';
import 'package:recruitment/features/login/domain/use_cases/login_usecase.dart';
import 'package:recruitment/features/login/domain/use_cases/verify_otp_usecase.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';
import 'package:recruitment/features/news/data/repositories/articles_repository_implementation.dart';
import 'package:recruitment/features/news/presentation/bloc/news_bloc.dart';
import 'package:recruitment/features/signup/data/data_sources/signup_data_source.dart';
import 'package:recruitment/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:recruitment/features/signup/domain/repositories/signup_repository.dart';
import 'package:recruitment/features/signup/presentation/bloc/signup_bloc.dart';
import '../../features/enable_totp/data/data_sources/enable_totp_data_source.dart';
import '../../features/enable_totp/data/repositories/enable_totp_repository_impl.dart';
import '../../features/enable_totp/domain/repositories/enable_totp_repository.dart';
import '../../features/enable_totp/presentation/bloc/enable_totp_bloc.dart';
import '../../features/login/domain/use_cases/logout_usecase.dart';
import '../../features/news/data/data_sources/news_data_source.dart';
import '../../features/news/domain/repositories/articles_repository.dart';
import '../../features/signup/domain/use_cases/signup_usecase.dart';

final sl = GetIt.instance;

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}

Future<void> initializeDependencies() async {
  final FlutterSecureStorage sharedPref = FlutterSecureStorage();
  sl.registerSingleton(sharedPref);
  // Data sources
  sl.registerSingleton<NewsDataSource>(NewsDataSource());
  sl.registerSingleton<LocalLoginDataSource>(LocalLoginDataSource(sl()));
  sl.registerSingleton<SignupDataSource>(SignupDataSource());
  sl.registerSingleton<RemoteLoginDataSource>(RemoteLoginDataSource(sl()));
  sl.registerSingleton<EnableTotpDataSource>(EnableTotpDataSource(sl()));
  // Repository
  sl.registerLazySingleton<ArticleRepository>(() => ArticlesRepositoryImplementation(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<SignupRepository>(() => SignupRepositoryImpl(sl()));
  sl.registerLazySingleton<EnableTotpRepository>(() => EnableTotpRepositoryImpl(sl()));
  // UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<SignupUseCase>(SignupUseCase(sl()));
  sl.registerSingleton<VerifyOtpUseCase>(VerifyOtpUseCase(sl()));
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase(sl()));
  sl.registerSingleton<CheckLoggedInUseCase>(CheckLoggedInUseCase(sl()));
  // Blocs
  sl.registerFactory(() => NewsBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => SignupBloc(sl()));
  sl.registerFactory(() => EnableTotpBloc(sl()));
  // Storage
}
