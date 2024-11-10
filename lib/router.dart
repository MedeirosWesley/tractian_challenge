import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/features/company/presentation/pages/company_page.dart';

abstract class Routers {
  static get routes => GoRouter(
        initialLocation: '/companies',
        routes: [
          GoRoute(
            path: '/companies',
            pageBuilder: (context, state) => const MaterialPage(
                child: CompanyPage(), fullscreenDialog: true),
          ),
        ],
      );
}
