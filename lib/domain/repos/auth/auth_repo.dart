import '../../../core/Result/result.dart';
import '../../../data/models/request/register_request.dart';
import '../../../domain/entities/user.dart';

abstract class AuthRepo {
  Future<Result<User?>> login(
      {required String email, required String password});

  Future<Result<User?>> register(RegisterRequest registerBody);

  Future<Result<bool>> forgetPassword(String email);

  Future<Result<bool>> verifyResetCode(String code);

  Future<Result<User?>> resetPassword({
    required String email,
    required String newPassword,
  });
}
