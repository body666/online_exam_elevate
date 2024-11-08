import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/core/utils/services/cache_service.dart';
import 'package:online_exam_elevate/domain/usecases/auth/forget_password_usecase.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/forget_pass/forget_pass_view_model.dart';

import 'forget_pass_view_model_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase, CacheService])
void main() {
  group(
    'forget_pass_view_model_test',
    () {
      test(
        'when call viewModel forgetPass function with email'
        'it should call forgetPasswordUseCase.invoke(email) and emit states',
        () async {
          // arrange
          final forgetPasswordUseCase = MockForgetPasswordUseCase();
          final cacheService = MockCacheService();
          final forgetPassViewModel = ForgetPassViewModel(
            forgetPasswordUseCase,
            cacheService,
          );
          const email = 'esmail@gmail.com';
          final mockedResult = Failure<bool>(Exception());
          provideDummy<Result<bool>>(mockedResult);
          when(forgetPasswordUseCase.invoke(email)).thenAnswer(
            (_) async => mockedResult,
          );

          // act
          final result = await forgetPassViewModel.forgetPass(email);

          // assert
          verify(forgetPasswordUseCase.invoke(email)).called(1);
        },
      );
    },
  );
}
