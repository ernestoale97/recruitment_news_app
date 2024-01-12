import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String? email;
  final String? token;

  const UserLoginEntity({this.email, this.token});

  @override
  List<Object?> get props => [
    email,
    token
  ];
}
