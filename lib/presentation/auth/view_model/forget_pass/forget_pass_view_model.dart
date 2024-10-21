import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/Result/result.dart';
import 'package:online_exam_elevate/core/utils/app_constants.dart';
import 'package:online_exam_elevate/core/utils/services/cache_service.dart';
import 'package:online_exam_elevate/domain/usecases/auth/forget_password_usecase.dart';

import 'forget_pass_state.dart';

@injectable
class ForgetPassViewModel extends Cubit<ForgetPassState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPassViewModel(this._forgetPasswordUseCase) : super(ForgetPassInitial());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = '';

  void activateValidationMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(ActivateValidationMode());
  }

  void saveEmail(String value) {
    email = value;
    emit(SaveEmailState());
  }

  Future<void> forgetPass(String email) async {
    emit(EmailSendingLoading());
    final result = await _forgetPasswordUseCase.invoke(email);

    switch (result) {
      case Success():
        {
          GetIt.instance.get<CacheService>().saveData(
                key: AppConstants.resetPassEmailKey,
                value: email,
              );
          emit(EmailSentSuccess());
        }
      case Failure():
        {
          emit(EmailSentFailure(result.exception));
        }
    }
  }
}
