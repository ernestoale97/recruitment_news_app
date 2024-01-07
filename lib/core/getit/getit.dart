import 'package:get_it/get_it.dart';
import 'package:recruitment/features/news/data/repositories/articles-repository-implementation.dart';
import 'package:recruitment/features/news/presentation/bloc/news-bloc.dart';
import '../../features/news/data/data-sources/news-data-source.dart';
import '../../features/news/domain/repositories/articles-repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data sources
  sl.registerSingleton<NewsDataSource>(NewsDataSource());
  // Repository
  sl.registerLazySingleton<ArticleRepository>(() => ArticlesRepositoryImplementation(sl()));
  // Blocs
  sl.registerFactory(() => NewsBloc(sl()));
}