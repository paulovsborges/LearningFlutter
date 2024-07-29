import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/home/home_page.dart';
import 'package:presentation/features/login/register/register_page.dart';
import 'package:presentation/features/navigation/bottom_nav_container_page.dart';
import 'package:presentation/features/profile/profile_page.dart';

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
                path: ProfilePage.routeName,
                builder: (_, __) {
                  return const ProfilePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RegisterPage.routeName,
                builder: (_, __) {
                  return const RegisterPage();
                },
              ),
            ],
          ),
        ],
        // builder: (_, __, child) {
        //   return BottomNavContainerPage(child: child);
        // },
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
