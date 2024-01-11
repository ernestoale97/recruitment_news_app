import 'dart:convert';
import 'dart:io';

import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/data/data_sources/local/local_login_data_source.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';

import '../../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/activate_totp_response.dart';
import '../../../../core/resources/generate_totp_response.dart';

class EnableTotpDataSource {
  final LocalLoginDataSource _localLoginDataSource;
  EnableTotpDataSource(this._localLoginDataSource);

  Future<ActivateTotpResponse> activateTotp(String totp) async {
    try {
      const userUuid = "af7206c5-58c5-46f2-9bc5-2cf942e036da";
      String? token =  await _localLoginDataSource.getAccessToken();
      final uri = Uri.parse("$loginApiUrl/users/$userUuid/totp");
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
      const userUuid = "af7206c5-58c5-46f2-9bc5-2cf942e036da";
      String? token =  await _localLoginDataSource.getAccessToken();
      final uri = Uri.parse("$loginApiUrl/users/$userUuid/totp");
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
