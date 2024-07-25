import 'package:go_router/go_router.dart';
import 'package:presentation/features/home/home_page.dart';

class HomeModule {
  static List<GoRoute> routes() {
    return [
      GoRoute(
        path: HomePage.routeName,
        builder: (routeContext, state) {
          return const HomePage();
        },
      ),
    ];
  }
}
