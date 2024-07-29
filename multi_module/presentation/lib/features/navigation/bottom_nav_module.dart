import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/account/account_routes.dart';
import 'package:presentation/features/account/profile/profile_page.dart';
import 'package:presentation/features/home/home_page.dart';
import 'package:presentation/features/navigation/bottom_nav_container_page.dart';

class BottomNavModule {
  static List<RouteBase> routes() {
    return [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: HomePage.routeName,
                builder: (routeContext, state) {
                  return const HomePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search_page',
                builder: (_, __) {
                  return const Placeholder();
                },
              ),
            ],
          ),
          StatefulShellBranch(routes: AccountRoutes.routes()),
        ],
        pageBuilder: (_, state, shell) {
          return MaterialPage(
            key: state.pageKey,
            child: BottomNavContainerPage(child: shell),
          );
        },
      ),
    ];
  }
}
