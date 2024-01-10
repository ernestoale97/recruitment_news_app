import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/login/presentation/pages/login_page.dart';
import 'package:recruitment/features/news/domain/entities/article_entity.dart';
import 'package:recruitment/features/news/presentation/pages/news_details_page.dart';
import 'package:recruitment/features/news/presentation/pages/news_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const NewsPage(),
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
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginPage(),
    )
  ],
);
