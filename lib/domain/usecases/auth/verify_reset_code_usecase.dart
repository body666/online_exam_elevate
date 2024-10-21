import 'package:injectable/injectable.dart';

import '../../../core/Result/result.dart';
import '../../repos/auth/auth_repo.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo _authRepo;

  VerifyResetCodeUseCase(this._authRepo);

  Future<Result<bool>> invoke(String code) async {
    return await _authRepo.verifyResetCode(code);
  }
}
