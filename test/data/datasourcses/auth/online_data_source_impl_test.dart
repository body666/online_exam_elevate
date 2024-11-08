import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/data/datasourcses/auth/online_data_source_impl.dart';
import 'package:online_exam_elevate/domain/entities/user.dart';

import 'online_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthOnlineDataSourceImpl])
void main() {
  group(
    'authOnlineDataSourceImpl forgetPassword function tests',
    () {
      test(
        'when i call authOnlineDataSourceImpl forgetPassword function with a valid email'
        'it Should return Success(bool)',
        () async {
          // arrange
          final authOnlineDataSourceImpl = MockAuthOnlineDataSourceImpl();
          const email = 'esmailahmed511@gmail.com';
          final expectedResult = Success<bool>(true);
          provideDummy<Result<bool>>(expectedResult);

          when(authOnlineDataSourceImpl.forgetPassword(email)).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final actual = await authOnlineDataSourceImpl.forgetPassword(email);
          // assert
          expect(actual, expectedResult);
        },
      );
      test(
        'when i call authOnlineDataSourceImpl forgetPassword function with a wrong email'
        'it Should return Failure(Exception)',
        () async {
          // arrange
          final authOnlineDataSourceImpl = MockAuthOnlineDataSourceImpl();
          const email = '123@gmail.com';
          final expectedResult = Failure<bool>(Exception());
          provideDummy<Result<bool>>(expectedResult);

          when(authOnlineDataSourceImpl.forgetPassword(email)).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final actual = await authOnlineDataSourceImpl.forgetPassword(email);
          // assert
          expect(actual, expectedResult);
        },
      );
    },
  );
  group(
    'authOnlineDataSourceImpl verifyResetCode function tests',
    () {
      test(
        'when i call authOnlineDataSourceImpl verifyResetCode function with a valid code'
        'it Should return Success(bool)',
        () async {
          // arrange
          final authOnlineDataSourceImpl = MockAuthOnlineDataSourceImpl();
          const code = '123456';
          final expectedResult = Success<bool>(true);
          provideDummy<Result<bool>>(expectedResult);

          when(authOnlineDataSourceImpl.verifyResetCode(code)).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final actual = await authOnlineDataSourceImpl.verifyResetCode(code);
          // assert
          expect(actual, expectedResult);
        },
      );
      test(
        'when i call authOnlineDataSourceImpl verifyResetCode function with a wrong code'
        'it Should return Failure(Exception)',
        () async {
          // arrange
          final authOnlineDataSourceImpl = MockAuthOnlineDataSourceImpl();
          const code = '324242';
          final expectedResult = Failure<bool>(Exception());
          provideDummy<Result<bool>>(expectedResult);

          when(authOnlineDataSourceImpl.verifyResetCode(code)).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final actual = await authOnlineDataSourceImpl.verifyResetCode(code);
          // assert
          expect(actual, expectedResult);
        },
      );
    },
  );
  group(
    'authOnlineDataSourceImpl resetPassword function tests',
    () {
      test(
        'when i call authOnlineDataSourceImpl resetPassword function with a valid email and rePassword'
        'it Should return Success(User())',
        () async {
          // arrange
          final authOnlineDataSourceImpl = MockAuthOnlineDataSourceImpl();
          const email = 'esmailahmed511@gmail.com';
          const rePassword = 'Ahmed123@';
          final expectedResult = Success<User?>(User());
          provideDummy<Result<User?>>(expectedResult);

          when(
            authOnlineDataSourceImpl.resetPassword(
              email: email,
              newPassword: rePassword,
            ),
          ).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final actual = await authOnlineDataSourceImpl.resetPassword(
            email: email,
            newPassword: rePassword,
          );
          // assert
          expect(actual, expectedResult);
        },
      );
      test(
        'when i call authOnlineDataSourceImpl resetPassword function with a wrong email '
        'it Should return Failure(Exception)',
        () async {
          // arrange
          final authOnlineDataSourceImpl = MockAuthOnlineDataSourceImpl();
          const email = '123@gmail.com';
          const rePassword = 'Ahmed123@';
          final expectedResult = Failure<User?>(Exception());
          provideDummy<Result<User?>>(expectedResult);

          when(
            authOnlineDataSourceImpl.resetPassword(
              email: email,
              newPassword: rePassword,
            ),
          ).thenAnswer(
            (_) async => expectedResult,
          );

          // act
          final actual = await authOnlineDataSourceImpl.resetPassword(
            email: email,
            newPassword: rePassword,
          );
          // assert
          expect(
            actual,
            expectedResult,
          );
        },
      );
    },
  );
}
