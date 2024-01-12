import 'dart:convert';
import 'dart:io';
import 'package:recruitment/features/signup/domain/entities/signup_form.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../models/signup_response.dart';

class SignupDataSource {
    Future<SignupResponse> signup(SignupFormEntity signupFormEntity) async {
        try {
            final uri = Uri.parse("$loginApiUrl/signup");
            http.Response response = await http.post(
                uri,
                headers: {
                    "Content-Type": "application/json "
                },
                body: json.encode({
                    "email": signupFormEntity.email.trim(),
                    "password": signupFormEntity.password
                })
            );
            final body = jsonDecode(response.body);
            if(response.statusCode == 201) {
                return SignupDoneResponse();
            }
            return SignupErrorResponse(message: body["message"]);
        } on HttpException catch(e) {
            return SignupErrorResponse(message: e.message);
        }
    }
}
