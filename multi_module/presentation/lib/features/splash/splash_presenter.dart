import 'package:bloc/bloc.dart';
import 'package:domain/entity/state_machine.dart';
import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:flutter/material.dart';

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
  SplashPresenter({required this.repository}) : super(const SplashState());

  final InitialConfigRepository repository;

  void fetchInitialConfiguration() async {
    emit(state.copyWith(state: StateMachine.loadingState()));
    await repository.fetchInitialConfig();
    emit(state.copyWith(state: StateMachine.successState(null)));
    emit(state.copyWith(state: StateMachine.idleState()));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
