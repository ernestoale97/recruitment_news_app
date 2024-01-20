import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment/features/login/data/data_sources/local/local_login_data_source.dart';
import 'package:recruitment/features/login/data/data_sources/remote/remote_login_data_source.dart';
import 'package:recruitment/features/login/data/repositories/login_repository_impl.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';
import 'package:recruitment/features/login/domain/use_cases/check_logged_in_usecase.dart';
import 'package:recruitment/features/login/domain/use_cases/login_usecase.dart';
import 'package:recruitment/features/login/domain/use_cases/logout_usecase.dart';
import 'package:recruitment/features/login/domain/use_cases/verify_otp_usecase.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';
import 'package:recruitment/features/news/data/data_sources/news_data_source.dart';
import 'package:recruitment/features/news/data/repositories/news_repository_impl.dart';
import 'package:recruitment/features/news/domain/repositories/news_repository.dart';
import 'package:recruitment/features/news/domain/use_cases/fetch_news_usecase.dart';
import 'package:recruitment/features/news/presentation/bloc/news_bloc.dart';
import 'package:recruitment/features/settings/enable_totp/data/data_sources/enable_totp_data_source.dart';
import 'package:recruitment/features/settings/enable_totp/data/repositories/enable_totp_repository_impl.dart';
import 'package:recruitment/features/settings/enable_totp/domain/repositories/enable_totp_repository.dart';
import 'package:recruitment/features/settings/enable_totp/domain/use_cases/activate_totp_usecase.dart';
import 'package:recruitment/features/settings/enable_totp/domain/use_cases/generate_totp_usecase.dart';
import 'package:recruitment/features/settings/enable_totp/presentation/bloc/enable_totp_bloc.dart';
import 'package:recruitment/features/signup/data/data_sources/signup_data_source.dart';
import 'package:recruitment/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:recruitment/features/signup/domain/repositories/signup_repository.dart';
import 'package:recruitment/features/signup/domain/use_cases/signup_usecase.dart';
import 'package:recruitment/features/signup/presentation/bloc/signup_bloc.dart';

final sl = GetIt.instance;

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}

Future<void> initializeDependencies() async {
  // Storages
  sl.registerSingleton(const FlutterSecureStorage());
  // Clients
  sl.registerSingleton(http.Client());
  // Data sources
  sl.registerSingleton<LocalLoginDataSource>(
      LocalLoginDataSourceImpl(sl(), sl()));
  sl.registerSingleton<RemoteLoginDataSource>(
      RemoteLoginDataSourceImpl(sl(), sl()));
  sl.registerSingleton<SignupDataSource>(SignupDataSourceImpl(sl()));
  sl.registerSingleton<NewsDataSource>(NewsDataSourceImpl(sl()));
  sl.registerSingleton<EnableTotpDataSource>(
      EnableTotpDataSourceImpl(sl(), sl()));
  // Repositories
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<SignupRepository>(() => SignupRepositoryImpl(sl()));
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(sl()));
  sl.registerLazySingleton<EnableTotpRepository>(
      () => EnableTotpRepositoryImpl(sl()));
  // UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<SignupUseCase>(SignupUseCase(sl()));
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase(sl()));
  sl.registerSingleton<CheckLoggedInUseCase>(CheckLoggedInUseCase(sl()));
  sl.registerSingleton<FetchNewsUseCase>(FetchNewsUseCase(sl()));
  sl.registerSingleton<GenerateTotpUseCase>(GenerateTotpUseCase(sl()));
  sl.registerSingleton<ActivateTotpUseCase>(ActivateTotpUseCase(sl()));
  sl.registerSingleton<VerifyOtpUseCase>(VerifyOtpUseCase(sl()));
  // Blocs
  sl.registerFactory(() => LoginBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => SignupBloc(sl()));
  sl.registerFactory(() => NewsBloc(sl()));
  sl.registerFactory(() => EnableTotpBloc(sl(), sl()));
}
