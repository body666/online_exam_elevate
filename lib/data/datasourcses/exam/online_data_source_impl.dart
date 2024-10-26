import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';

import '../../api/api_extensions.dart';
import '../../api/api_manager.dart';
import '../../contracts/exam/online_data_source.dart';

@Injectable(as: ExamOnlineDataSource)
class ExamOnlineDataSourceImpl implements ExamOnlineDataSource {
  final ApiManager _apiManager;

  ExamOnlineDataSourceImpl(this._apiManager);

  @override
  Future<Result<List<Exam>>> fetchSubjectExams(String subject) {
    return executeApi<List<Exam>>(
      () async {
        final subjectExamsResponse =
            await _apiManager.fetchSubjectExams(subject);
        final List<Exam> exams = [];
        if (subjectExamsResponse != null &&
            subjectExamsResponse.exams != null) {
          for (var exam in subjectExamsResponse.exams!) {
            exams.add(
              exam.toExam(),
            );
          }
        }
        return exams;
      },
    );
  }
}
