import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/utils/services/api/api_consonants.dart';
import 'package:online_exam_elevate/data/models/response/forget_password_response.dart';
import 'package:online_exam_elevate/data/models/response/reset_pass_response.dart';

import '../../../../data/models/request/register_request.dart';
import '../../../../data/models/response/auth_response.dart';

@Singleton()
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConsonants.baseUrl,
      ),
    );
  }

  Future<AuthResponse?> login({
    required String email,
    required String password,
  }) async {
    var response = await _dio.post(ApiConsonants.signInEndPoint, data: {
      "email": email,
      "password": password,
    });
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse?> register(RegisterRequest registerRequest) async {
    var response = await _dio.post(
      ApiConsonants.signUpEndpoint,
      data: {registerRequest},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    return AuthResponse.fromJson(response.data);
  }

  Future<ForgetPasswordResponse?> forgetPassword(String email) async {
    final response = await _dio.post(
      ApiConsonants.forgetPassEndPoint,
      data: {
        "email": email,
      },
    );
    final forgetPassResponse = ForgetPasswordResponse.fromJson(response.data);
    return forgetPassResponse;
  }

  Future<bool> verifyResetCode(String code) async {
    final response = await _dio.post(
      ApiConsonants.verifyResetCodeEndPoint,
      data: {
        "resetCode": code,
      },
    );
    final statusCode = response.statusCode;
    return statusCode == 200;
  }

  Future<ResetPassResponse?> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final response = await _dio.put(
      ApiConsonants.resetPasswordEndPoint,
      data: {
        "email": email,
        "newPassword": newPassword,
      },
    );
    final resetPassResponse = ResetPassResponse.fromJson(response.data);
    return resetPassResponse;
  }
}
