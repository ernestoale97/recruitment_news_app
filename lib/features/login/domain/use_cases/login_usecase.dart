import 'package:recruitment/features/login/data/models/login_response.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

import '../entities/login_form.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  Future<LoginResponse> call(LoginFormEntity loginForm) async {
    return await repository.login(loginForm);
  }
}
