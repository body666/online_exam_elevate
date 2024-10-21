sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoading extends VerifyCodeState {}

final class VerifyCodeSuccess extends VerifyCodeState {}

final class VerifyCodeFailure extends VerifyCodeState {
  final Exception? exception;

  VerifyCodeFailure(this.exception);
}

final class ResendVerifyCodeLoading extends VerifyCodeState {}

final class ResendVerifyCodeSuccess extends VerifyCodeState {}

final class ResendVerifyCodeFailure extends VerifyCodeState {
  final Exception? exception;

  ResendVerifyCodeFailure(this.exception);
}
