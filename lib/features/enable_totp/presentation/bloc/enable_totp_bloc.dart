import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recruitment/core/resources/activate_totp_response.dart';
import 'package:recruitment/core/resources/generate_totp_response.dart';
import '../../domain/repositories/enable_totp_repository.dart';
part 'enable_totp_event.dart';
part 'enable_totp_state.dart';

class EnableTotpBloc extends Bloc<EnableTotpEvent, EnableTotpState> {
  final EnableTotpRepository _enableTotpRepository;
  EnableTotpBloc(this._enableTotpRepository) : super(EnableTotpInitialState()) {
    on<GenerateTotpEvent>(_generateTotp);
    on<ActivateTotpEvent>(_activateTotp);
  }

  Future<void> _generateTotp(GenerateTotpEvent event, Emitter<EnableTotpState> emit) async {
    emit(GeneratingTotpState());
    try {
      final data = await _enableTotpRepository.generateTotp();
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
      final data = await _enableTotpRepository.activateTotp(event.totp);
      if (data is ActivatedTotpResponse) {
        emit(ActivatedTotpState());
      }
      if (data is ActivateTotpFailResponse) {
        emit(ActivateTotpFailedState());
      }
    } on Object catch (e) {
      emit(ActivateTotpFailedState());
    }
  }
}
