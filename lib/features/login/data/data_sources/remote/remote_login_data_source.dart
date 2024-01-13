import 'dart:convert';
import 'dart:io';
import 'package:recruitment/features/login/domain/entities/login_response.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';
import 'package:recruitment/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment/features/login/data/data_sources/local/local_login_data_source.dart';

abstract class RemoteLoginDataSource {
  Future<LoginResponse> login(LoginFormEntity loginForm);
  Future<LoginResponse> verifyTotp(int totp);
}

class RemoteLoginDataSourceImpl implements RemoteLoginDataSource {
  final LocalLoginDataSource _localLoginDataSource;
  final http.Client client;
  RemoteLoginDataSourceImpl(this._localLoginDataSource, this.client);

  @override
  Future<LoginResponse> login(LoginFormEntity loginForm) async {
    try {
      final uri = Uri.parse("$loginApiUrl/login");
      http.Response response = await client.post(
          uri,
          headers: {
            "Content-Type": "application/json "
          },
          body: json.encode({
            "email": loginForm.email.trim(),
            "password": loginForm.password
          })
      );
      final body = jsonDecode(response.body);
      if(response.statusCode == 200) {
        if (body["data"]["mfa_required"]) {
          return LoginTotpRequiredResponse(
              mfaToken: body["data"]["mfa_token"],
              mfaRequired: body["data"]["mfa_required"]
          );
        }
        return LoginSuccessResponse(
          userEmail: body["data"]["email"],
          accessToken: body["data"]["access_token"],
        );
      }
      return LoginErrorResponse(message: body["message"]);
    } on HttpException catch(e) {
      return LoginErrorResponse(message: e.message);
    }
  }

  @override
  Future<LoginResponse> verifyTotp(int totp) async {
    try {
      String? token =  await _localLoginDataSource.getVerifyTotpToken();
      if (token == null) {
        return LoginErrorResponse(message: 'Verify token needed');
      }
      final uri = Uri.parse("$loginApiUrl/verify-totp");
      http.Response response = await client.post(
          uri,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "totp": totp,
          })
      );
      final body = jsonDecode(response.body);
      if(response.statusCode == 200) {
        return LoginSuccessResponse(
          accessToken: body["data"]["access_token"],
          userEmail: body["data"]["email"],
        );
      }
      return LoginErrorResponse(message: body["message"]);
    } on HttpException catch(e) {
      return LoginErrorResponse(message: e.message);
    }
  }
}
