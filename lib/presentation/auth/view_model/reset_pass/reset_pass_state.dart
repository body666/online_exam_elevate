sealed class ResetPassState {}

final class ResetPassInitial extends ResetPassState {}

final class ResetPassLoading extends ResetPassState {}

final class ResetPassSuccess extends ResetPassState {}

final class ResetPassFailure extends ResetPassState {
  final Exception? exception;

  ResetPassFailure(this.exception);
}
