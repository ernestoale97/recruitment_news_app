import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/login/presentation/pages/login_page.dart';
import 'package:recruitment/features/login/presentation/pages/totp_verify_page.dart';
import 'package:recruitment/features/news/domain/entities/article_entity.dart';
import 'package:recruitment/features/news/presentation/pages/news_details_page.dart';
import 'package:recruitment/features/news/presentation/pages/news_page.dart';
import 'package:recruitment/features/signup/presentation/pages/signup_page.dart';
import 'package:recruitment/features/settings/enable_totp/presentation/pages/enable_totp_page.dart';
import 'package:recruitment/features/settings/settings/presentation/pages/settings_page.dart';

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
        GoRoute(
            path: 'settings',
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'activate_totp',
                builder: (BuildContext context, GoRouterState state) {
                  return const EnableTotpPage();
                },
              )
            ]
        ),
      ],
    ),
    GoRoute(
        path: '/login',
        builder: (_, __) => const LoginPage(),
        routes: [
          GoRoute(
            path: 'verify-totp',
            builder: (_, __) => const TotpVerifyPage(),
          ),
          GoRoute(
              path: 'signup',
              builder: (_, __) => const SignupPage()
          )
        ]
    ),
  ],
);
