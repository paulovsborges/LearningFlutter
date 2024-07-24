abstract class StateMachine {}

abstract class ProgressState implements StateMachine {}

class ProgressLoadingState implements ProgressState {}

class ProgressIdleState implements ProgressState {}

class Success<T> implements ProgressState {
  Success({required this.data});

  final T data;
}

class Error implements ProgressState {
  Error(this.exception);

  final Exception exception;
}
