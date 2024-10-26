import '../../../core/Result/result.dart';
import '../../../domain/entities/exam.dart';

abstract class ExamOnlineDataSource {
  Future<Result<List<Exam>>> fetchSubjectExams(String subject);
}
