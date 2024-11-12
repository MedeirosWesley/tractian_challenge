import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/features/asset/presentation/pages/asset_page.dart';
import 'package:tractian_challenge/features/home/presentation/pages/company_page.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

abstract class Routers {
  static final GoRouter routes = GoRouter(
    initialLocation: '/home',
    navigatorKey: _navigatorKey,
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomePage(), fullscreenDialog: true),
      ),
      GoRoute(
          name: 'assets',
          path: '/assets/:companyId',
          pageBuilder: (context, state) {
            final String companyId = state.pathParameters['companyId']!;
            return MaterialPage(
              child: AssetPage(companyId: companyId),
              fullscreenDialog: true,
            );
          }),
    ],
  );
}
