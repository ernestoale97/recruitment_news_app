import 'package:recruitment/features/signup/domain/entities/signup_form.dart';

import '../entities/signup_response.dart';

abstract class SignupRepository {
    Future<SignupResponse> signup(SignupFormEntity signupFormEntity);
}