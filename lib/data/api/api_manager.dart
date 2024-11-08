import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/data/api/api_consonants.dart';
import 'package:online_exam_elevate/data/models/response/forget_password_response.dart';
import 'package:online_exam_elevate/data/models/response/reset_pass_response.dart';
import 'package:online_exam_elevate/data/models/response/subject_exams_response/subject_exams_response.dart';

import '../models/request/register_request.dart';
import '../models/response/auth_response.dart';

@Singleton()
class ApiManager {
  final Dio _dio;

  ApiManager({required Dio dio}) : _dio = dio;

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
    ForgetPasswordResponse? forgetPassResponse;
    final response = await _dio.post(
      ApiConsonants.forgetPassEndPoint,
      data: {
        "email": email,
      },
    );
    forgetPassResponse = ForgetPasswordResponse.fromJson(response.data);
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
    ResetPassResponse? resetPassResponse;
    final response = await _dio.put(
      ApiConsonants.resetPasswordEndPoint,
      data: {
        "email": email,
        "newPassword": newPassword,
      },
    );
    resetPassResponse = ResetPassResponse.fromJson(response.data);
    return resetPassResponse;
  }

  Future<SubjectExamsResponse?> fetchSubjectExams(String subject) async {
    SubjectExamsResponse? subjectExamsResponse;
    final response = await _dio.get(
      ApiConsonants.fetchSubjectExamsEndPoint,
      queryParameters: {
        'subject': subject,
      },
      options: Options(
        headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDAxNjkyZjg3YzQ4NjYzYWVlM2FkNyIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcyODA4Mjc5MX0.s7uFfpSqEfrTz9un6WL_YUM6_-3-_-KwHloU4VtDBeE',
        },
      ),
    );
    subjectExamsResponse = SubjectExamsResponse.fromJson(response.data);
    return subjectExamsResponse;
  }
}
