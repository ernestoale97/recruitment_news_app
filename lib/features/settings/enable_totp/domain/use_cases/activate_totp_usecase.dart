import 'package:recruitment/features/settings/enable_totp/domain/entities/activate_totp_response.dart';
import 'package:recruitment/features/settings/enable_totp/domain/repositories/enable_totp_repository.dart';

class ActivateTotpUseCase {
  final EnableTotpRepository repository;
  ActivateTotpUseCase(this.repository);

  Future<ActivateTotpResponse> call(totp) async {
    return await repository.activateTotp(totp);
  }
}
