import 'package:recruitment/features/login/domain/entities/login_response.dart';
import 'package:recruitment/features/login/domain/entities/login_form.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginFormEntity loginForm);
  Future<void> logout();
  Future<String?> getToken();
  Future<String?> getEmail();
  Future<LoginResponse> verifyOtp(int totp);
}
