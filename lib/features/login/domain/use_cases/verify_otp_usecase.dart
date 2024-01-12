import 'package:recruitment/features/login/domain/entities/login_response.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

import '../entities/login_form.dart';

class VerifyOtpUseCase {
  final LoginRepository repository;
  VerifyOtpUseCase(this.repository);

  Future<LoginResponse> call(int totp) async {
    return await repository.verifyOtp(totp);
  }
}
