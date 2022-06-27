import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  signIn,
  signUp,
  dashboard,
}

final goRouter = GoRouter(
  initialLocation: '/signIn',
  routes: [
    GoRoute(
      path: '/signIn',
      name: AppRoute.signIn.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: '/signUp',
      name: AppRoute.signUp.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SignUpPage(),
    ),
    GoRoute(
      path: '/dashboard',
      name: AppRoute.dashboard.name,
      builder: (BuildContext context, GoRouterState state) {
        final String? username = state.queryParams[Keys.username];
        return DashboardPage(username: username ?? 'Annonymous');
      },
    )
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
