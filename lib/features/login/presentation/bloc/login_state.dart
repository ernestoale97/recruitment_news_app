part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

// Totp Verification
class VerifyingTotpState extends LoginState {
  @override
  List<Object> get props => [];
}

class VerifiedTotpState extends LoginState {
  final String email;
  const VerifiedTotpState(this.email);

  @override
  List<Object> get props => [
    email
  ];
}

class VerifyFailTotpState extends LoginState {
  final String message;
  const VerifyFailTotpState(this.message);

  @override
  List<Object> get props => [
    message
  ];
}
// Totp Verification


class LogoutSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedOutState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedInState extends LoginState {
  final String email;
  const LoggedInState(this.email);

  @override
  List<Object> get props => [
    email
  ];
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
  final String email;
  const LoginSuccess(this.email);

  @override
  List<Object> get props => [
    email
  ];
}
