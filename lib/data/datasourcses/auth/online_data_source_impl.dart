import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/utils/services/api/api_extensions.dart';
import 'package:online_exam_elevate/core/utils/services/api/api_manager.dart';
import 'package:online_exam_elevate/data/contracts/auth/online_data_source.dart';
import 'package:online_exam_elevate/data/models/dtos/user_dto.dart';
import 'package:online_exam_elevate/data/models/request/register_request.dart';

import '../../../core/Result/result.dart';
import '../../../domain/entities/user.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiManager _apiManager;

  AuthOnlineDataSourceImpl(this._apiManager);

  @override
  Future<Result<User?>> login({
    required String email,
    required String password,
  }) {
    return executeApi<User>(() async {
      final authResponse = await _apiManager.login(
        email: email,
        password: password,
      );

      final userDto = UserDto(
        token: authResponse?.token,
      );
      return userDto.toUser();
    });
  }

  @override
  Future<Result<User?>> register(RegisterRequest registerRequest) {
    return executeApi<User>(() async {
      final authResponse = await _apiManager.register(registerRequest);

      final userDto = UserDto(
        token: authResponse?.token,
      );
      return userDto.toUser();
    });
  }

  @override
  Future<Result<bool>> forgetPassword(String email) {
    return executeApi<bool>(
      () async {
        final forgetPassRes = await _apiManager.forgetPassword(email);
        return forgetPassRes != null;
      },
    );
  }

  @override
  Future<Result<bool>> verifyResetCode(String code) {
    return executeApi<bool>(
      () async {
        final isVerified = await _apiManager.verifyResetCode(code);
        return isVerified;
      },
    );
  }

  @override
  Future<Result<User?>> resetPassword({
    required String email,
    required String newPassword,
  }) {
    return executeApi<User>(
      () async {
        final resetPassRes = await _apiManager.resetPassword(
          email: email,
          newPassword: newPassword,
        );
        final userDto = UserDto(token: resetPassRes?.token);
        return userDto.toUser();
      },
    );
  }
}
