import 'package:domain/repository/initialConfig/initial_config_mock_repository.dart';
import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/splash/splash_page.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

class SplashModule {
  static void startModules() {
    debugPrint('splash module start');

    GetIt.I.registerLazySingleton<InitialConfigRepository>(
      () => InitialConfigMockRepository(),
      dispose: (instance) {
        debugPrint('$instance disposed');
      },
    );

    GetIt.I.registerLazySingleton<SplashPresenter>(
      () => SplashPresenter(
        repository: GetIt.I.get(),
      ),
      dispose: (instance) {
        debugPrint('$instance disposed');
      },
    );
  }

  static List<GoRoute> routes() {
    return [
      GoRoute(
        path: SplashPage.routeName,
        builder: (routeContext, state) {
          return BlocProvider<SplashPresenter>(
            create: (_) {
              return GetIt.I.get();
            },
            child: SplashPage(presenter: GetIt.I.get()),
          );
        },
        onExit: (_, __) async {
          GetIt.I.resetLazySingleton<InitialConfigRepository>();
          GetIt.I.resetLazySingleton<SplashPresenter>();
          return true;
        },
      ),
    ];
  }
}
