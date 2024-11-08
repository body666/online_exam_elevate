import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/domain/repos/auth/auth_repo.dart';
import 'package:online_exam_elevate/domain/usecases/auth/forget_password_usecase.dart';

import 'forget_password_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  test(
    'when call forgetPasswordUseCase  invoke function'
    'it should call authRepo.forgetPassword() and return Result<bool>',
    () async {
      // arrange
      final authRepo = MockAuthRepo();
      final forgetPassUseCase = ForgetPasswordUseCase(authRepo);
      const email = 'esmailahmed511@gmail.com';
      final mockedResult = Success<bool>(true);
      provideDummy<Result<bool>>(mockedResult);

      when(authRepo.forgetPassword(email)).thenAnswer(
        (_) async => mockedResult,
      );
      // act
      final actual = await forgetPassUseCase.invoke(email);

      // assert
      verify(authRepo.forgetPassword(email)).called(1);
      expect(
        actual,
        mockedResult,
      );
    },
  );
}
