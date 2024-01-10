import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;
  LoginBloc(this._loginRepository) : super(LoginInitial()) {
    on<LoginRequestEvent>(_login);
    on<CheckLoggedInEvent>(_checkLoggedIn);
  }

  Future<void> _checkLoggedIn(CheckLoggedInEvent event, Emitter<LoginState> emit) async {
    emit(LoggedOutState());
  }

  Future<void> _login(LoginRequestEvent event, Emitter<LoginState> emit) async {
    emit(LoginSending());
    try {
      final response = await _loginRepository.login(event.loginForm);
      if (response is LoginSuccessResponse) {
        emit(LoginSuccess());
      } else if (response is LoginTotpRequiredResponse) {
        emit(LoginTotpRequired());
      } else if (response is LoginErrorResponse) {
        emit(LoginError(response.message));
      }
    } on Object catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const LoginError("There was an error while trying to login"));
    }
  }
}
