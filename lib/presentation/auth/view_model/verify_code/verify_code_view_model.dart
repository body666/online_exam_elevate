import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/domain/usecases/auth/forget_password_usecase.dart';
import 'package:online_exam_elevate/domain/usecases/auth/verify_reset_code_usecase.dart';

import 'verify_code_state.dart';

@injectable
class VerifyCodeViewModel extends Cubit<VerifyCodeState> {
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  VerifyCodeViewModel(
    this._verifyResetCodeUseCase,
    this._forgetPasswordUseCase,
  ) : super(VerifyCodeInitial());

  static VerifyCodeViewModel of(BuildContext context) =>
      BlocProvider.of(context);
  bool hasError = false;

  Future<void> verify(String code) async {
    emit(VerifyCodeLoading());
    final result = await _verifyResetCodeUseCase.invoke(code);

    switch (result) {
      case Success<bool>():
        {
          hasError = false;
          emit(VerifyCodeSuccess());
        }
      case Failure<bool>():
        {
          hasError = true;
          emit(VerifyCodeFailure(result.exception));
        }
    }
  }

  Future<void> resendCode(String email) async {
    emit(ResendVerifyCodeLoading());
    final result = await _forgetPasswordUseCase.invoke(email);

    switch (result) {
      case Success<bool>():
        {
          hasError = false;
          emit(ResendVerifyCodeSuccess());
        }
      case Failure<bool>():
        {
          emit(ResendVerifyCodeFailure(result.exception));
        }
    }
  }
}
