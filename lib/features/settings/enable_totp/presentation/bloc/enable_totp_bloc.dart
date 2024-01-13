import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment/features/settings/enable_totp/domain/use_cases/generate_totp_usecase.dart';
import '../../domain/entities/activate_totp_response.dart';
import '../../domain/entities/generate_totp_response.dart';
import '../../domain/use_cases/activate_totp_usecase.dart';

part 'enable_totp_event.dart';
part 'enable_totp_state.dart';

class EnableTotpBloc extends Bloc<EnableTotpEvent, EnableTotpState> {
  final GenerateTotpUseCase _generateTotpUseCase;
  final ActivateTotpUseCase _activateTotpUseCase;
  EnableTotpBloc(this._generateTotpUseCase, this._activateTotpUseCase) : super(EnableTotpInitialState()) {
    on<GenerateTotpEvent>(_generateTotp);
    on<ActivateTotpEvent>(_activateTotp);
  }

  Future<void> _generateTotp(GenerateTotpEvent event, Emitter<EnableTotpState> emit) async {
    emit(GeneratingTotpState());
    try {
      final data = await _generateTotpUseCase.call();
      if (data is GeneratedTotpResponse) {
        emit(GeneratedTotpState(data));
      } else if (data is GenerateFailResponse){
        emit(GenerateTotpFailedState(data.message));
      } else {
        emit(GenerateTotpFailedState("Error generating TOTP Info"));
      }
    } on Object catch (e) {
      emit(GenerateTotpFailedState(e.toString()));
    }
  }

  Future<void> _activateTotp(ActivateTotpEvent event, Emitter<EnableTotpState> emit) async {
    emit(ActivatingTotpState());
    try {
      final data = await _activateTotpUseCase.call(event.totp);
      if (data is ActivatedTotpResponse) {
        emit(ActivatedTotpState());
      }
      if (data is ActivateTotpFailResponse) {
        emit(ActivateTotpFailedState(data.message));
      }
    } on Object catch (e) {
      emit(ActivateTotpFailedState(e.toString()));
    }
  }
}
