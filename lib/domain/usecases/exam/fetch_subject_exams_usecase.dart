import 'package:injectable/injectable.dart';

import '../../../core/Result/result.dart';
import '../../entities/exam.dart';
import '../../repos/exam/exam_repo.dart';

@injectable
class FetchSubjectExamsUseCase {
  final ExamRepo _examRepo;

  FetchSubjectExamsUseCase(this._examRepo);
  Future<Result<List<Exam>>> invoke(String subject) async {
    return await _examRepo.fetchSubjectExams(subject);
  }
}
