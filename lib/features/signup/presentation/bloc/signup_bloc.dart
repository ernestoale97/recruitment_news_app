import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recruitment/features/signup/data/models/signup_response.dart';

import '../../domain/entities/signup_form.dart';
import '../../domain/use_cases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase _signupUseCase;
  SignupBloc(this._signupUseCase) : super(SignupInitialState()) {
    on<SignupRequestEvent>(_signup);
  }

  Future<void> _signup(SignupRequestEvent event, Emitter<SignupState> emit) async {
    emit(SignupOnProcessState());
    try {
      final response = await _signupUseCase.call(event.signupFormEntity);
      if (response is SignupDoneResponse) {
        emit(SignupDoneState());
      } else if (response is SignupErrorResponse) {
        emit(SignupErrorState(response.message));
      }
    } on Object catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(const SignupErrorState("There was an error while trying to signup"));
    }
  }
}
