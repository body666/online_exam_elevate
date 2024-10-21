import 'package:injectable/injectable.dart';

import '../../../core/Result/result.dart';
import '../../../data/models/request/register_request.dart';
import '../../entities/user.dart';
import '../../repos/auth/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;

  RegisterUseCase(this._authRepo);

  Future<Result<User?>> invoke(RegisterRequest registerRequest) {
    return _authRepo.register(registerRequest);
  }
}
