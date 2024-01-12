import 'package:recruitment/features/signup/domain/entities/signup_form.dart';

import '../../data/models/signup_response.dart';

abstract class SignupRepository {
    Future<SignupResponse> signup(SignupFormEntity signupFormEntity);
}