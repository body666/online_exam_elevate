import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/Result/result.dart';
import '../../../../domain/usecases/auth/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUseCase.invoke(email: email, password: password);

    switch (result) {
      case Success():
        {
          emit(LoginSuccess());
        }

      case Failure():
        {
          emit(LoginError(result.exception));
        }
    }
  }
}
