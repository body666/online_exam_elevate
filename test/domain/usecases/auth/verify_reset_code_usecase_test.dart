import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/domain/repos/auth/auth_repo.dart';
import 'package:online_exam_elevate/domain/usecases/auth/verify_reset_code_usecase.dart';

import 'verify_reset_code_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  test(
    'when call VerifyResetCodeUseCase invoke function'
    'it should call authRepo.verifyResetCode() and return Result<bool>',
    () async {
      // arrange
      final authRepo = MockAuthRepo();
      final verifyResetCodeUseCase = VerifyResetCodeUseCase(authRepo);
      const code = '123145';

      final mockedResult = Success<bool>(true);
      provideDummy<Result<bool>>(mockedResult);

      when(authRepo.verifyResetCode(code)).thenAnswer(
        (_) async => mockedResult,
      );

      // act
      final actual = await verifyResetCodeUseCase.invoke(code);

      // assert
      verify(
        authRepo.verifyResetCode(
          code,
        ),
      ).called(1);
      expect(
        actual,
        mockedResult,
      );
    },
  );
}
