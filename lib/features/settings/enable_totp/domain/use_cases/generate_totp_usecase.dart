import 'package:recruitment/features/settings/enable_totp/domain/entities/generate_totp_response.dart';
import 'package:recruitment/features/settings/enable_totp/domain/repositories/enable_totp_repository.dart';

class GenerateTotpUseCase {
  final EnableTotpRepository repository;
  GenerateTotpUseCase(this.repository);

  Future<GenerateTotpResponse> call() async {
    return await repository.generateTotp();
  }
}
