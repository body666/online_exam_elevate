sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final Exception? exception;

  LoginError(this.exception);
}

final class LoginLoading extends LoginState {}
