import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/domain/entities/user.dart';
import 'package:online_exam_elevate/domain/repos/auth/auth_repo.dart';
import 'package:online_exam_elevate/domain/usecases/auth/reset_password_usecase.dart';

import 'reset_password_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  test(
    'when call ResetPasswordUseCase invoke function with email and newPass'
    'It should call authRepo.resetPassword() and return Result<User>()',
    () async {
      // arrange
      final authRepo = MockAuthRepo();
      final resetPassUseCase = ResetPasswordUseCase(authRepo);
      const email = 'esmailahmed511@gmail.com';
      const newPassword = 'Ahmed123@';
      final mockedResult = Success<User?>(
        User(),
      );
      provideDummy<Result<User?>>(mockedResult);

      when(authRepo.resetPassword(
        email: email,
        newPassword: newPassword,
      )).thenAnswer(
        (_) async => mockedResult,
      );

      // act
      final actual = await resetPassUseCase.invoke(
        email: email,
        newPassword: newPassword,
      );

      // assert
      verify(
        authRepo.resetPassword(
          email: email,
          newPassword: newPassword,
        ),
      ).called(1);
      expect(
        actual,
        mockedResult,
      );
    },
  );
}
