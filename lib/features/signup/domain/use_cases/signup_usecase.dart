import 'package:recruitment/features/signup/data/models/signup_response.dart';
import 'package:recruitment/features/signup/domain/repositories/signup_repository.dart';
import '../entities/signup_form.dart';

class SignupUseCase {
  final SignupRepository repository;
  SignupUseCase(this.repository);

  Future<SignupResponse> call(SignupFormEntity signupFormEntity) async {
    return await repository.signup(signupFormEntity);
  }
}
