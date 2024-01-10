part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoggedOutState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedInState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSending extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  const LoginError(this.message);
  final String message;

  @override
  List<Object> get props => [];
}

class LoginTotpRequired extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}