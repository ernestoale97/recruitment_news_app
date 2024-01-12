import 'package:equatable/equatable.dart';

abstract class ActivateTotpResponse extends Equatable {}

class ActivatedTotpResponse extends ActivateTotpResponse {
  @override
  List<Object?> get props => [];
}

class ActivateTotpFailResponse extends ActivateTotpResponse {
  final String message;
  ActivateTotpFailResponse({required this.message});

  @override
  List<Object?> get props => [
    message
  ];
}
