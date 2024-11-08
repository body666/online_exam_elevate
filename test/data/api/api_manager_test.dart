import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/data/api/api_consonants.dart';
import 'package:online_exam_elevate/data/api/api_manager.dart';
import 'package:online_exam_elevate/data/models/response/reset_pass_response.dart';
import 'package:online_exam_elevate/data/models/response/subject_exams_response/subject_exams_response.dart';

import 'api_manager_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockedDio;
  late ApiManager apiManager;
  setUp(() {
    // arrange
    mockedDio = MockDio();
    apiManager = ApiManager(dio: mockedDio);
  });
  group(
    'api manager forgetPassword function test',
    () {
      test(
        'when i call forgetPassword with valid email address'
        'it should return ForgetPasswordResponse object',
        () async {
          // arrange
          final mockedDioResult = Response<Map<String, dynamic>>(
            requestOptions: RequestOptions(),
            data: {},
          );
          const path = ApiConsonants.forgetPassEndPoint;
          when(mockedDio.post(path)).thenAnswer(
            (_) async => mockedDioResult,
          );
          // act
          final actual = await mockedDio.post(path);

          // assert
          expect(
            actual,
            mockedDioResult,
          );
        },
      );
      test(
        'when i call forgetPassword with wrong email address'
        'it should return null ForgetPasswordResponse object',
        () async {
          // arrange
          const input = '123@1elevate.com';
          when(apiManager.forgetPassword(input)).thenAnswer(
            (_) async => null,
          );
          // act
          final result = await apiManager.forgetPassword(input);

          // assert
          expect(
            result,
            null,
          );
        },
      );
    },
  );

  group(
    'api manager resetPassword function test',
    () {
      test(
        'when i call resetPassword with wrong email and a correct repassWord'
        'it should return a null instead of ResetPassResponse ',
        () async {
          // arrange
          const email = '123@1elevate.com';
          const rePassword = 'Ahmed123@';
          when(
            apiManager.resetPassword(
              email: email,
              newPassword: rePassword,
            ),
          ).thenAnswer(
            (_) async => null,
          );
          // act
          final result = await apiManager.resetPassword(
            email: email,
            newPassword: rePassword,
          );

          // assert
          expect(
            result,
            null,
          );
        },
      );
      test(
        'when resetPassword is called with a valid email and new password, '
        'it should return a ResetPassResponse object',
        () async {
          // Arrange
          const email = 'esmailahmed511@gmail.com';
          const newPassword = 'Ahmed123@';

          final mockResponse = Response<Map<String, dynamic>>(
            requestOptions: RequestOptions(baseUrl: ApiConsonants.baseUrl),
            data: {"message": 'token', "token": 'token'},
          );

          // Mock the Dio call to return the correct response type
          when(mockedDio.put<Map<String, dynamic>>(
            ApiConsonants.resetPasswordEndPoint,
            data: {'email': email, 'newPassword': newPassword},
          )).thenAnswer((_) async => mockResponse);

          // Act
          final result = await apiManager.resetPassword(
            email: email,
            newPassword: newPassword,
          );

          // Assert
          expect(result, isA<ResetPassResponse>());

          // Verify the mock interactions
          verify(() => mockedDio.put<Map<String, dynamic>>(
                ApiConsonants.resetPasswordEndPoint,
                data: {'email': email, 'newPassword': newPassword},
              )).called(1);
        },
      );
    },
  );
  group(
    'apiManager verifyResetCode function test',
    () {
      test(
        'when i call verifyResetCode with a wrong resetCode'
        'it should return false',
        () async {
          // arrange
          const code = '123456';

          when(
            apiManager.verifyResetCode(code),
          ).thenAnswer(
            (_) async => false,
          );
          // act
          final result = await apiManager.verifyResetCode(code);

          // assert
          expect(
            result,
            false,
          );
        },
      );
      test(
        'when i call verifyResetCode with a correct resetCode'
        'it should return true',
        () async {
          // arrange
          const code = '123456';

          when(
            apiManager.verifyResetCode(code),
          ).thenAnswer(
            (_) async => true,
          );
          // act
          final result = await apiManager.verifyResetCode(code);

          // assert
          expect(
            result,
            true,
          );
        },
      );
    },
  );

  group(
    'apiManager fetchSubjectExams function test',
    () {
      test(
        'when i call fetchSubjectExams with a wrong subject'
        'it should return null',
        () async {
          // arrange
          const subject = '670037f6728c92b7fdf434fc________';

          when(
            apiManager.fetchSubjectExams(subject),
          ).thenAnswer(
            (_) async => null,
          );
          // act
          final result = await apiManager.fetchSubjectExams(subject);

          // assert
          expect(
            result,
            null,
          );
        },
      );
      test(
        'when i call fetchSubjectExams with a valid subject'
        'it should return SubjectExamsResponse',
        () async {
          // arrange
          const subject = '670037f6728c92b7fdf434fc';
          final expectedResult = SubjectExamsResponse();
          when(
            apiManager.fetchSubjectExams(subject),
          ).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final result = await apiManager.fetchSubjectExams(subject);

          // assert
          expect(
            result,
            expectedResult,
          );
        },
      );
    },
  );
}
