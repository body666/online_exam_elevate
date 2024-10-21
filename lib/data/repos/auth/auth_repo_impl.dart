import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/data/contracts/auth/offline_data_source.dart';
import 'package:online_exam_elevate/data/contracts/auth/online_data_source.dart';
import 'package:online_exam_elevate/data/models/request/register_request.dart';
import 'package:online_exam_elevate/domain/entities/user.dart';

import '../../../domain/repos/auth/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthOnlineDataSource _onlineDataSource;
  final AuthOfflineDataSource _offlineDataSource;

  AuthRepoImpl(
      {required AuthOnlineDataSource onlineDataSource,
      required AuthOfflineDataSource offlineDataSource})
      : _onlineDataSource = onlineDataSource,
        _offlineDataSource = offlineDataSource;

  @override
  Future<Result<User?>> login(
      {required String email, required String password}) {
    return _onlineDataSource.login(email: email, password: password);
  }

  @override
  Future<Result<User?>> register(RegisterRequest registerRequest) {
    return _onlineDataSource.register(registerRequest);
  }

  @override
  Future<Result<bool>> forgetPassword(String email) async {
    return await _onlineDataSource.forgetPassword(email);
  }

  @override
  Future<Result<bool>> verifyResetCode(String code) async {
    return await _onlineDataSource.verifyResetCode(code);
  }

  @override
  Future<Result<User?>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    return await _onlineDataSource.resetPassword(
      email: email,
      newPassword: newPassword,
    );
  }
}
