part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupRequestEvent extends SignupEvent {
  final SignupFormEntity signupFormEntity;
  const SignupRequestEvent(this.signupFormEntity);
  
  @override
  List<Object> get props => [
    signupFormEntity
  ];
}
