import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';

import '../../repos/auth/auth_repo.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo _authRepo;

  ForgetPasswordUseCase(this._authRepo);

  Future<Result<bool>> invoke(String email) async {
    return await _authRepo.forgetPassword(email);
  }
}
