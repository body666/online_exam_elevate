import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/core/utils/app_constants.dart';
import 'package:online_exam_elevate/core/utils/services/cache_service.dart';
import 'package:online_exam_elevate/domain/entities/user.dart';
import 'package:online_exam_elevate/domain/usecases/auth/reset_password_usecase.dart';

import '../../../../core/Result/result.dart';
import 'reset_pass_state.dart';

@injectable
class ResetPassViewModel extends Cubit<ResetPassState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPassViewModel(this._resetPasswordUseCase) : super(ResetPassInitial());

  Future<void> resetPass(
      {required String email, required String newPassword}) async {
    emit(ResetPassLoading());
    final result = await _resetPasswordUseCase.invoke(
      email: email,
      newPassword: newPassword,
    );

    switch (result) {
      case Success<User?>():
        {
          GetIt.instance.get<CacheService>().saveData(
                key: AppConstants.userTokenKey,
                value: result.data?.token,
              );
          emit(ResetPassSuccess());
        }

      case Failure<User?>():
        {
          emit(ResetPassFailure(result.exception));
        }
    }
  }

  String? validateNewPass(String? value) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';

    if (value == null || value.trim().isEmpty) {
      return 'Enter your new password';
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Enter a valid password';
    }
    return null;
  }

  String? validateConfirmPass(
      {required String? value, required String? newPassValue}) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirm password';
    }
    if (value.trim() != newPassValue) {
      return 'Password does not match';
    }
    return null;
  }
}
