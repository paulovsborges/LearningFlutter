import 'package:bloc/bloc.dart';
import 'package:domain/entity/state_machine.dart';
import 'package:domain/repository/initialConfig/initial_config_repository.dart';

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
}
