import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/data/contracts/auth/online_data_source.dart';
import 'package:online_exam_elevate/data/repos/auth/auth_repo_impl.dart';
import 'package:online_exam_elevate/domain/entities/user.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthOnlineDataSource])
void main() {
  late MockAuthOnlineDataSource authOnlineDataSource;
  late AuthRepoImpl authRepo;
  setUp(() {
    authOnlineDataSource = MockAuthOnlineDataSource();
    authRepo = AuthRepoImpl(authOnlineDataSource);
  });
  group(
    'authRepoImpl functions test',
    () {
      test(
        'when call authRepoImpl forgetPassword function with email'
        'it should call onlineDataSource.forgotPassword()',
        () async {
          // arrange
          const email = 'esmailahmed@gmail.com';
          final mockedResult = Success<bool>(true);
          provideDummy<Result<bool>>(mockedResult);
          when(authOnlineDataSource.forgetPassword(email)).thenAnswer(
            (_) async => mockedResult,
          );
          // act
          final actual = await authRepo.forgetPassword(email);

          // assert
          verify(authOnlineDataSource.forgetPassword(email)).called(1);
          expect(actual, mockedResult);
        },
      );
      test(
        'when call authRepoImpl verifyResetCode function with code'
        'it should call onlineDataSource.verifyResetCode()',
        () async {
          // arrange
          const code = '234232';

          final mockedResult = Success<bool>(true);
          provideDummy<Result<bool>>(mockedResult);
          when(authOnlineDataSource.verifyResetCode(code)).thenAnswer(
            (_) async => mockedResult,
          );
          // act
          final actual = await authRepo.verifyResetCode(code);

          // assert
          verify(authOnlineDataSource.verifyResetCode(code)).called(1);
          expect(
            actual,
            mockedResult,
          );
        },
      );
      test(
        'when call authRepoImpl resetPassword function with email and rePassword'
        'it should call onlineDataSource.resetPassword()',
        () async {
          // arrange
          const email = 'esmailahmed@gmail.com';
          const rePassword = 'Ahmed123@';
          final mockedResult = Success<User?>(User());
          provideDummy<Result<User?>>(mockedResult);

          when(
            authOnlineDataSource.resetPassword(
              email: email,
              newPassword: rePassword,
            ),
          ).thenAnswer(
            (_) async => mockedResult,
          );
          // act
          final actual = await authRepo.resetPassword(
            email: email,
            newPassword: rePassword,
          );

          // assert
          verify(
            authOnlineDataSource.resetPassword(
              email: email,
              newPassword: rePassword,
            ),
          ).called(1);
          expect(
            actual,
            mockedResult,
          );
        },
      );
    },
  );
}
