import 'package:domain/entity/state_machine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/common/app_assets.dart';
import 'package:presentation/features/login/register/register_page.dart';
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
      body: BlocListener<SplashPresenter, SplashState>(
        listener: (_, state) {
          if (state.state is SuccessState) {
            context.pushReplacement(RegisterPage.routeName);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                AppAssets.splashBackground,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
