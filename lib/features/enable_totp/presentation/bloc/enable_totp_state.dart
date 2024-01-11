part of 'enable_totp_bloc.dart';

@immutable
abstract class EnableTotpState {}

class EnableTotpInitialState extends EnableTotpState {}

class GeneratingTotpState extends EnableTotpState {}

class GeneratedTotpState extends EnableTotpState {
  GeneratedTotpResponse data;
  GeneratedTotpState(this.data);
}

class GenerateTotpFailedState extends EnableTotpState {
  String message;
  GenerateTotpFailedState(this.message);
}

class ActivatingTotpState extends EnableTotpState {}

class ActivatedTotpState extends EnableTotpState {}

class ActivateTotpFailedState extends EnableTotpState {
  String message;
  ActivateTotpFailedState(this.message);
}
