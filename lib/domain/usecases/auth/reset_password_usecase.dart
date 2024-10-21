import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/domain/entities/user.dart';

import '../../../core/Result/result.dart';
import '../../repos/auth/auth_repo.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepo;

  ResetPasswordUseCase(this._authRepo);

  Future<Result<User?>> invoke(
      {required String email, required String newPassword}) async {
    return await _authRepo.resetPassword(
        email: email, newPassword: newPassword);
  }
}
