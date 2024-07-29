import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/account/login/login_page.dart';
import 'package:presentation/features/account/profile/profile_page.dart';
import 'package:presentation/features/login/auth_presenter.dart';

class AccountRoutes {
  static List<GoRoute> routes() {
    return [
      GoRoute(
        path: ProfilePage.routeName,
        builder: (_, __) {
          return ProfilePage(
            presenter: GetIt.I.get<AuthPresenter>(),
          );
        },
        redirect: (_, __) {
          final presenter = GetIt.I.get<AuthPresenter>();

          if (presenter.state.userToken == null) {
            return LoginPage.routeName;
          } else {
            return ProfilePage.routeName;
          }
        },
      ),
      GoRoute(
        path: LoginPage.routeName,
        builder: (_, __) {
          return const LoginPage();
        },
      ),
    ];
  }
}
