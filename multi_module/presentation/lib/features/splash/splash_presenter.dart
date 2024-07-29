import 'package:bloc/bloc.dart';
import 'package:domain/entity/state_machine.dart';
import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/features/login/auth_presenter.dart';

class SplashState {
  const SplashState({this.state = const ProgressIdleState()});

  final StateMachine state;

  SplashState copyWith({
    StateMachine? state,
  }) {
    return SplashState(state: state ?? this.state);
  }
}

class SplashPresenter extends Cubit<SplashState> {
  SplashPresenter({
    required this.repository,
    required this.authPresenter,
  }) : super(const SplashState());

  final InitialConfigRepository repository;
  final AuthPresenter authPresenter;

  void fetchInitialConfiguration() async {

    if(authPresenter.state.userToken == null){
      debugPrint('user token null');
    }

    emit(state.copyWith(state: StateMachine.loadingState()));
    await repository.fetchInitialConfig();
    emit(state.copyWith(state: StateMachine.successState(null)));
    emit(state.copyWith(state: StateMachine.idleState()));
  }
}
