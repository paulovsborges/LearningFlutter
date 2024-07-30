import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/splash/splash_page.dart';

class SplashModule {
  static List<GoRoute> routes() {
    return [
      GoRoute(
        path: SplashPage.routeName,
        builder: (routeContext, state) {
          return SplashPage(presenter: GetIt.I.get());
        },
        onExit: (_, __) async {
          GetIt.I.resetLazySingleton<InitialConfigRepository>();
          return true;
        },
      ),
    ];
  }
}
