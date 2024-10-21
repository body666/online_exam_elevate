sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class EmailSendingLoading extends ForgetPassState {}

final class EmailSentSuccess extends ForgetPassState {}

final class EmailSentFailure extends ForgetPassState {
  final Exception? exception;

  EmailSentFailure(this.exception);
}

final class ActivateValidationMode extends ForgetPassState {}

final class SaveEmailState extends ForgetPassState {}
