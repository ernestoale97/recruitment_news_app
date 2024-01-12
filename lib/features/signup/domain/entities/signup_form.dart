import 'package:equatable/equatable.dart';

class SignupFormEntity extends Equatable {
  final String email;
  final String password;

  const SignupFormEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [
    email,
    password
  ];
}
