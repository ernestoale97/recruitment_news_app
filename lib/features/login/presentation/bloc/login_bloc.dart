import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment/features/login/data/models/login_response.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';
import 'package:recruitment/features/login/domain/use_cases/verify_otp_usecase.dart';
import '../../domain/use_cases/check_logged_in_usecase.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/logout_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckLoggedInUseCase _checkLoggedInUseCase;
  LoginBloc(this._loginUseCase, this._verifyOtpUseCase, this._logoutUseCase, this._checkLoggedInUseCase) : super(LoginInitial()) {
    on<LoginRequestEvent>(_login);
    on<VerifyTotpRequestEvent>(_verifyTotp);
    on<LogoutRequestEvent>(_logout);
    on<CheckLoggedInEvent>(_checkLoggedIn);
  }

  Future<void> _checkLoggedIn(CheckLoggedInEvent event, Emitter<LoginState> emit) async {
    try {
      final response = await _checkLoggedInUseCase.call();
      if (response != null) {
        emit(LoggedInState(response.email!));
      } else {
        emit(LoggedOutState());
      }
    } catch (e) {
      emit(LoggedOutState());
    }
  }

  Future<void> _login(LoginRequestEvent event, Emitter<LoginState> emit) async {
    emit(LoginSending());
    try {
      final response = await _loginUseCase.call(event.loginForm);
      if (response is LoginSuccessResponse) {
        emit(LoginSuccess(response.userEmail));
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

  Future<void> _verifyTotp(VerifyTotpRequestEvent event, Emitter<LoginState> emit) async {
    emit(VerifyingTotpState());
    try {
      final response = await _verifyOtpUseCase.call(event.totp);
      if (response is LoginSuccessResponse) {
        emit(VerifiedTotpState(response.userEmail));
      } else if (response is LoginErrorResponse) {
        emit(VerifyFailTotpState(response.message));
      }
    } on Object catch (e) {
      emit(const VerifyFailTotpState("There was an error while trying to verify 2FA"));
    }
  }

  Future<void> _logout(LogoutRequestEvent event, Emitter<LoginState> emit) async {
    try {
      await _logoutUseCase.call();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutSuccessState());
    }
  }
}
