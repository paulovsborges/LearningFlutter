import 'package:bloc/bloc.dart';
import 'package:domain/entity/state_machine.dart';

class SplashState {
  const SplashState({
    this.state =  const ProgressIdleState()
  });

  final StateMachine state;
}

class SplashPresenter extends Cubit<SplashState> {
  SplashPresenter() : super(const SplashState());


}
