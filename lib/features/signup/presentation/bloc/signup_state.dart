part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitialState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupOnProcessState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupDoneState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupErrorState extends SignupState {
  final String message;
  const SignupErrorState(this.message);

  @override
  List<Object> get props => [
    message
  ];
}
