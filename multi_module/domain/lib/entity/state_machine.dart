abstract class StateMachine {}

abstract class ProgressState implements StateMachine {}

final class ProgressLoadingState implements ProgressState {
  const ProgressLoadingState();
}

final class ProgressIdleState implements ProgressState {
  const ProgressIdleState();
}

final class Success<T> implements ProgressState {
  const Success({required this.data});

  final T data;
}

final class Error implements ProgressState {
  const Error(this.exception);

  final Exception exception;
}
