import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_work/features/authentication/presentation/pages/initial_page.dart';
import 'package:practice_work/features/authentication/presentation/pages/login_page.dart';
import 'package:practice_work/features/authentication/presentation/pages/sign_up_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return InitialPage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return SignUpPage();
        },
      ),
    ],
  );
}
