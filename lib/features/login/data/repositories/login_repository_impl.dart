import 'dart:io';

import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/data/data_sources/login_data_source.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';

import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl(this._loginDataSource);
  final LoginDataSource _loginDataSource;

  @override
  Future<LoginResponse> login(LoginFormEntity loginForm) {
    return _loginDataSource.login(loginForm);
  }
}
