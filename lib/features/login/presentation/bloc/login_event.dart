part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequestEvent extends LoginEvent {
  final LoginFormEntity loginForm;
  LoginRequestEvent({required this.loginForm});

  @override
  List<Object> get props => [
    loginForm
  ];
}

class CheckLoggedInEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}


class LogoutRequestEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}