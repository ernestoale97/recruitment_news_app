import 'dart:convert';
import 'dart:io';

import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';

import '../../../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;

class RemoteLoginDataSource {
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
      print(body);
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
}
