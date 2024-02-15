import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_modular/first_page.dart';
import 'package:learning_modular/mock_service.dart';
import 'package:learning_modular/second_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IsEventNumberService>(IsEventNumberServiceImpl.new);
    i.addSingleton(MockService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => FirstPage(
        service: Modular.get(),
      ),
    );
    r.child('/second/:name',
        child: (context) => SecondPage(
              name: r.args.params['name'],
            ),
        transition: TransitionType.leftToRight);
  }
}
