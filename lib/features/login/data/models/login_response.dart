import 'package:equatable/equatable.dart';

abstract class LoginResponse extends Equatable {}

class LoginSuccessResponse extends LoginResponse {
  final String accessToken;
  final String userEmail;

  LoginSuccessResponse({required this.accessToken, required this.userEmail});

  @override
  List<Object?> get props => [
    accessToken,
    userEmail
  ];
}

class LoginTotpRequiredResponse extends LoginResponse {
  final String mfaToken;
  final bool mfaRequired;

  LoginTotpRequiredResponse({required this.mfaToken, required this.mfaRequired});

  @override
  List<Object?> get props => [
    mfaToken,
    mfaRequired
  ];
}

class LoginErrorResponse extends LoginResponse {
  final String message;

  LoginErrorResponse({required this.message});

  @override
  List<Object?> get props => [
    message
  ];
}
