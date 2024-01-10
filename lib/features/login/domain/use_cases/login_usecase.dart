import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

import '../entities/login_form.dart';

class SignInUseCase {
  final LoginRepository repository;

  SignInUseCase(this.repository);

  Future<LoginResponse> call(LoginFormEntity loginForm) async {
    return await repository.login(loginForm);
  }
}