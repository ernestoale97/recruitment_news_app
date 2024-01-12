import 'package:equatable/equatable.dart';

abstract class SignupResponse extends Equatable {}

class SignupDoneResponse extends SignupResponse {
  @override
  List<Object?> get props => [];
}

class SignupErrorResponse extends SignupResponse {
  final String message;
  SignupErrorResponse({required this.message});

  @override
  List<Object?> get props => [
    message
  ];
}
