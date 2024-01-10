import 'package:get_it/get_it.dart';
import 'package:recruitment/features/login/data/data_sources/login_data_source.dart';
import 'package:recruitment/features/login/data/repositories/login_repository_impl.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';
import 'package:recruitment/features/login/presentation/bloc/login_bloc.dart';
import 'package:recruitment/features/news/data/repositories/articles_repository_implementation.dart';
import 'package:recruitment/features/news/presentation/bloc/news_bloc.dart';
import '../../features/news/data/data_sources/news_data_source.dart';
import '../../features/news/domain/repositories/articles_repository.dart';

final sl = GetIt.instance;

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}

Future<void> initializeDependencies() async {
  // Data sources
  sl.registerSingleton<NewsDataSource>(NewsDataSource());
  sl.registerSingleton<LoginDataSource>(LoginDataSource());
  // Repository
  sl.registerLazySingleton<ArticleRepository>(() => ArticlesRepositoryImplementation(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  // Blocs
  sl.registerFactory(() => NewsBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
}