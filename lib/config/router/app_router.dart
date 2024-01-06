import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/news/presentation/pages/news-page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const NewsPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'news',
          builder: (BuildContext context, GoRouterState state) {
            return const NewsPage();
          },
        ),
      ],
    ),
  ],
);