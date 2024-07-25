import 'package:domain/repository/initialConfig/initial_config_mock_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/splash/splash_page.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

class SplashModule {
  static List<GoRoute> routes() {
    return [
      GoRoute(
        path: SplashPage.routeName,
        builder: (routeContext, state) {
          return BlocProvider(
            create: (_) => SplashPresenter(
              repository: InitialConfigMockRepository(),
            ),
            child: SplashPage(
              presenter: routeContext.read(),
            ),
          );
        },
      ),
    ];
  }
}
