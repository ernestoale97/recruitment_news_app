import 'dart:convert';
import 'dart:io';
import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';
import '../../../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../local/local_login_data_source.dart';

class RemoteLoginDataSource {
  final LocalLoginDataSource _localLoginDataSource;
  RemoteLoginDataSource(this._localLoginDataSource);

  Future<LoginResponse> login(LoginFormEntity loginForm) async {
    try {
      final uri = Uri.parse("$loginApiUrl/login");
      http.Response response = await http.post(
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
            accessToken: body["data"]["access_token"],
            mfaRequired: body["data"]["mfa_required"]
        );
      }
      return LoginErrorResponse(message: body["message"]);
    } on HttpException catch(e) {
      return LoginErrorResponse(message: e.message);
    }
  }

  Future<LoginResponse> verifyTotp(int totp) async {
    try {
      String? token =  await _localLoginDataSource.getVerifyTotpToken();
      if (token == null) {
        return LoginErrorResponse(message: 'Verify token needed');
      }
      final uri = Uri.parse("$loginApiUrl/verify-totp");
      http.Response response = await http.post(
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
            mfaRequired: body["data"]["mfa_required"]
        );
      }
      return LoginErrorResponse(message: body["message"]);
    } on HttpException catch(e) {
      return LoginErrorResponse(message: e.message);
    }
  }
}
