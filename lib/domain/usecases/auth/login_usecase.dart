import 'package:injectable/injectable.dart';

import '../../../core/Result/result.dart';
import '../../entities/user.dart';
import '../../repos/auth/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  Future<Result<User?>> invoke(
      {required String email, required String password}) async {
    return await _authRepo.login(email: email, password: password);
  }
}
