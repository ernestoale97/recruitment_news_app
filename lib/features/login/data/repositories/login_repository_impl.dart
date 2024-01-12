import 'dart:io';

import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/data/data_sources/local/local_login_data_source.dart';
import 'package:recruitment/features/login/data/data_sources/remote/remote_login_data_source.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';

import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl(this._localLoginDataSource, this._remoteLoginDataSource);
  final RemoteLoginDataSource _remoteLoginDataSource;
  final LocalLoginDataSource _localLoginDataSource;

  @override
  Future<LoginResponse> login(LoginFormEntity loginForm) async {
    LoginResponse response = await _remoteLoginDataSource.login(loginForm);
    if (response is LoginSuccessResponse) {
      await _localLoginDataSource.clearStorage();
      await _localLoginDataSource.saveAccessToken(response.accessToken);
      await _localLoginDataSource.saveUserEmail(response.userEmail);
    }
    if (response is LoginTotpRequiredResponse) {
      await _localLoginDataSource.clearStorage();
      await _localLoginDataSource.saveVerifyTotpToken(response.mfaToken);
    }
    return response;
  }

  @override
  Future<LoginResponse> verifyOtp(int totp) async {
    LoginResponse response = await _remoteLoginDataSource.verifyTotp(totp);
    if (response is LoginSuccessResponse) {
      await _localLoginDataSource.clearStorage();
      await _localLoginDataSource.saveAccessToken(response.accessToken);
    }
    return response;
  }

  @override
  Future<void> logout() async {
    _localLoginDataSource.clearStorage();
  }

  @override
  Future<String?> getToken() {
    return _localLoginDataSource.getAccessToken();
  }

  @override
  Future<String?> getEmail() {
    return _localLoginDataSource.getUserEmail();
  }
}
