import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_elevate/data/models/request/register_request.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/sign_up/sign_up_state.dart';

import '../../../../core/Result/result.dart';
import '../../../../domain/usecases/auth/register_usecase.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  final RegisterUseCase _registerUseCase;

  SignUpViewModel(this._registerUseCase) : super(SignUpInitial());

  Future<void> signUp(RegisterRequest registerRequest) async {
    emit(SignUpLoading());
    final result = await _registerUseCase.invoke(registerRequest);

    switch (result) {
      case Success():
        {
          emit(SignUpSuccess());
        }

      case Failure():
        {
          emit(SignUpError(result.exception));
        }
    }
  }
}
