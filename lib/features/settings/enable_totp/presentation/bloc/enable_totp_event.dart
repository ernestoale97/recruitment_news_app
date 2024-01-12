part of 'enable_totp_bloc.dart';

@immutable
abstract class EnableTotpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenerateTotpEvent extends EnableTotpEvent {
  @override
  List<Object?> get props => [];
}

class ActivateTotpEvent extends EnableTotpEvent {
  final String totp;
  ActivateTotpEvent({required this.totp});

  @override
  List<Object> get props => [
    totp
  ];
}