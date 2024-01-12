import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:recruitment/features/login/data/data_sources/local/local_login_data_source.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';
import '../../domain/entity/activate_totp_response.dart';
import '../../domain/entity/generate_totp_response.dart';

class EnableTotpDataSource {
  final LocalLoginDataSource _localLoginDataSource;
  EnableTotpDataSource(this._localLoginDataSource);

  Future<ActivateTotpResponse> activateTotp(String totp) async {
    try {
      String? token =  await _localLoginDataSource.getAccessToken();
      if (token == null) {
        return ActivateTotpFailResponse(message: "Token is missing");
      }
      var tokenClaims = Jwt.parseJwt(token);
      final uri = Uri.parse("$loginApiUrl/users/${tokenClaims["sub"]}/totp");
      http.Response response = await http.post(
          uri,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "totp": int.parse(totp),
          })
      );
      final body = response.body != "" ? jsonDecode(response.body) : "";
      if(response.statusCode == 204) {
        return ActivatedTotpResponse();
      }
      return ActivateTotpFailResponse(message: body["message"]);
    } on HttpException catch(e) {
      return ActivateTotpFailResponse(message: e.message);
    }
  }
  Future<GenerateTotpResponse> generateTotp() async {
    try {
      String? token =  await _localLoginDataSource.getAccessToken();
      if (token == null) {
        return GenerateFailResponse(message: "Token is missing");
      }
      var tokenClaims = Jwt.parseJwt(token);
      log(tokenClaims.toString());
      final uri = Uri.parse("$loginApiUrl/users/${tokenClaims["sub"]}/totp");
      http.Response response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      final body = jsonDecode(response.body);
      if(response.statusCode == 200) {
        return GeneratedTotpResponse(
          qr: body["qr"],
          secret: body["secret"],
        );
      }
      return GenerateFailResponse(message: body["message"]);
    } on HttpException catch(e) {
      return GenerateFailResponse(message: e.message);
    }
  }
}
