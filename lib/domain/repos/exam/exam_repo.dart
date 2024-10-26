import '../../../core/Result/result.dart';
import '../../entities/exam.dart';

abstract class ExamRepo {
  Future<Result<List<Exam>>> fetchSubjectExams(String subject);
}
