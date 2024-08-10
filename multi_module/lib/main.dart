import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_module/main_widget.dart';
import 'package:multi_module/modulesBinding/app_module.dart';
import 'package:presentation/features/details/details_page.dart';
import 'package:presentation/features/navigation/bottom_nav_module.dart';
import 'package:presentation/features/splash/splash_module.dart';
import 'package:presentation/features/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule.initAllModules();

  final router = GoRouter(
    initialLocation: SplashPage.routeName,
    routes: [
      ...SplashModule.routes(),
      ...BottomNavModule.routes(),
      GoRoute(
        path: DetailsPage.routeName,
        builder: (routeContext, state) {
          return DetailsPage(
            presenter: GetIt.I.get(),
          );
        },
        // onExit: (_, __){
        //   return true;
        // }
      ),
    ],
  );

  runApp(
    MainWidget(
      router: router,
    ),
  );
}
