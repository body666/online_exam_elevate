import '../../../core/Result/result.dart';
import '../../../domain/entities/user.dart';
import '../../models/request/register_request.dart';

abstract class AuthOnlineDataSource {
  Future<Result<User?>> login(
      {required String email, required String password});

  Future<Result<User?>> register(RegisterRequest registerRequest);

  Future<Result<bool>> forgetPassword(String email);

  Future<Result<bool>> verifyResetCode(String code);

  Future<Result<User?>> resetPassword({
    required String email,
    required String newPassword,
  });
}
