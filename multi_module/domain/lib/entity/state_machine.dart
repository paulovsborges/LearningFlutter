abstract class StateMachine{
  static ProgressLoadingState loadingState() {
    return const ProgressLoadingState();
  }

  static ProgressIdleState idleState() {
    return const ProgressIdleState();
  }

  static SuccessState successState<R>(R data) {
    return SuccessState(data: data);
  }

  static ErrorState errorState(Exception error) {
    return ErrorState(error);
  }
}

abstract class ProgressState implements StateMachine {}

final class ProgressLoadingState implements ProgressState {
  const ProgressLoadingState();
}

final class ProgressIdleState implements ProgressState {
  const ProgressIdleState();
}

final class SuccessState<T> implements StateMachine {
  const SuccessState({this.data});

  final T? data;
}

final class ErrorState implements ProgressState {
  const ErrorState(this.exception);

  final Exception exception;
}
