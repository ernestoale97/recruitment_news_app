import 'package:equatable/equatable.dart';

abstract class GenerateTotpResponse extends Equatable {}

class GeneratedTotpResponse extends GenerateTotpResponse {
  final String qr;
  final String secret;
  GeneratedTotpResponse({required this.qr, required this.secret});
  @override
  List<Object?> get props => [
    qr,
    secret
  ];
}

class GenerateFailResponse extends GenerateTotpResponse {
  final String message;
  GenerateFailResponse({required this.message});

  @override
  List<Object?> get props => [
    message
  ];
}
