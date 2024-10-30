sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpError extends SignUpState {
  final Exception? exception;

  SignUpError(this.exception);
}

final class SignUpLoading extends SignUpState {}
