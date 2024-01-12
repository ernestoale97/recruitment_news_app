import 'package:equatable/equatable.dart';

class LoginFormEntity extends Equatable {
  final String email;
  final String password;

  const LoginFormEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [
    email,
    password
  ];
}
