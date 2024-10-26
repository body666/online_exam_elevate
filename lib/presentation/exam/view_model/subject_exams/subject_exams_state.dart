part of 'subject_exams_view_model.dart';

@immutable
sealed class SubjectExamsState {}

final class SubjectExamsInitial extends SubjectExamsState {}

final class FetchSubjectExamsLoading extends SubjectExamsState {}

final class FetchSubjectExamsSuccess extends SubjectExamsState {
  final List<Exam> exams;

  FetchSubjectExamsSuccess(this.exams);
}

final class FetchSubjectExamsFailure extends SubjectExamsState {
  final Exception? exception;

  FetchSubjectExamsFailure(this.exception);
}
