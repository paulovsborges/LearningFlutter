import 'package:domain/entity/state_machine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/features/common/ncage_assets.dart';
import 'package:presentation/features/home/home_page.dart';
import 'package:presentation/features/navigation/n_cage_navigation_helper.dart';
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
      body: BlocProvider(
        create: (_) => widget.presenter,
        child: BlocListener<SplashPresenter, SplashState>(
          listener: (_, state) {
            if (state.state is SuccessState) {
              context.myRouterReplace(HomePage.routeName);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  NCageAssets.splashBackground,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}