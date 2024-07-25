import 'package:go_router/go_router.dart';
import 'package:presentation/features/login/accounts/accounts_page.dart';
import 'package:presentation/features/login/register/register_page.dart';

class LoginModule {
  static List<GoRoute> routes() {
    return [
      GoRoute(
        path: RegisterPage.routeName,
        routes: [
          GoRoute(
            path: AccountsPage.routeName,
            builder: (internalContext, state) {
              return const AccountsPage();
            },
          ),
        ],
        builder: (routeContext, state) {
          return const RegisterPage();
        },
      ),
    ];
  }
}
