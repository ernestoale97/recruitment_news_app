import '../entities/activate_totp_response.dart';
import '../entities/generate_totp_response.dart';

abstract class EnableTotpRepository {
  Future<ActivateTotpResponse> activateTotp(String totp);
  Future<GenerateTotpResponse> generateTotp();
}
