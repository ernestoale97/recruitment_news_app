part of 'enable_totp_bloc.dart';

@immutable
abstract class EnableTotpState {}

class EnableTotpInitialState extends EnableTotpState {}

class GeneratingTotpState extends EnableTotpState {}

class GeneratedTotpState extends EnableTotpState {
  final GeneratedTotpResponse data;
  GeneratedTotpState(this.data);
}

class GenerateTotpFailedState extends EnableTotpState {
  final String message;
  GenerateTotpFailedState(this.message);
}

class ActivatingTotpState extends EnableTotpState {}

class ActivatedTotpState extends EnableTotpState {}

class ActivateTotpFailedState extends EnableTotpState {
  final String message;
  ActivateTotpFailedState(this.message);
}
