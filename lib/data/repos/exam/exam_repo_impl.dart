import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/data/contracts/exam/offline_data_source.dart';
import 'package:online_exam_elevate/data/contracts/exam/online_data_source.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';
import 'package:online_exam_elevate/domain/repos/exam/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamOnlineDataSource _onlineDataSource;
  final ExamOfflineDataSource _offlineDataSource;

  ExamRepoImpl(this._onlineDataSource, this._offlineDataSource);

  @override
  Future<Result<List<Exam>>> fetchSubjectExams(String subject) async {
    return await _onlineDataSource.fetchSubjectExams(subject);
  }
}
