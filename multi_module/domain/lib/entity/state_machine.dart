abstract class StateMachine<R>{
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

final class SuccessState<R> implements StateMachine<R> {
  const SuccessState({this.data});

  final R? data;
}

final class ErrorState implements ProgressState {
  const ErrorState(this.exception);

  final Exception exception;
}
