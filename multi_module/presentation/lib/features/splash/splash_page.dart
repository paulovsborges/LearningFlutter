import 'package:domain/entity/state_machine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/login/login_page.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.presenter,
  });

  static const String routeName = '/splash_page';

  final SplashPresenter presenter;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.presenter.fetchInitialConfiguration();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text('Splash page'),
            BlocConsumer<SplashPresenter, SplashState>(
              bloc: widget.presenter,
              listener: (_, state) {
                if (state.state is SuccessState) {
                  context.pushReplacement(LoginPage.routeName);
                }

                if (state.state is ErrorState) {}
              },
              builder: (internalContext, state) {
                String label = 'idle';

                switch (state.state) {
                  case ProgressLoadingState _:
                    label = 'loading...';
                    break;
                  case SuccessState _:
                    label = 'succeeded!';
                    break;
                  case ErrorState _:
                    label = 'error :[';
                    break;
                  default:
                    label = 'idle';
                    break;
                }

                return Text(label);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
