import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';
import 'package:online_exam_elevate/domain/usecases/exam/fetch_subject_exams_usecase.dart';

part 'subject_exams_state.dart';

@injectable
class SubjectExamsViewModel extends Cubit<SubjectExamsState> {
  final FetchSubjectExamsUseCase _fetchSubjectExamsUseCase;
  SubjectExamsViewModel(this._fetchSubjectExamsUseCase)
      : super(SubjectExamsInitial());

  static SubjectExamsViewModel of(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> fetchSubjectExams(String subject) async {
    final result = await _fetchSubjectExamsUseCase.invoke(subject);
    switch (result) {
      case Success():
        {
          emit(FetchSubjectExamsSuccess(result.data!));
        }

      case Failure<List<Exam>>():
        {
          emit(FetchSubjectExamsFailure(result.exception));
        }
    }
  }
}
