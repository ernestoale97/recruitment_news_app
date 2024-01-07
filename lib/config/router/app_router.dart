import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/news/domain/entities/article-entity.dart';
import 'package:recruitment/features/news/presentation/bloc/news-bloc.dart';
import 'package:recruitment/features/news/presentation/pages/news-details-page.dart';
import 'package:recruitment/features/news/presentation/pages/news-page.dart';
import 'package:get_it/get_it.dart';

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => BlocProvider(
        create: (_) => NewsBloc(inject()),
        child:  NewsPage(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return NewsDetailsPage(
              article: state.extra as ArticleEntity,
            );
          },
        ),
      ],
    ),
  ],
);
