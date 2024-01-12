import 'package:recruitment/features/settings/enable_totp/domain/entity/activate_totp_response.dart';
import 'package:recruitment/features/settings/enable_totp/domain/entity/generate_totp_response.dart';

abstract class EnableTotpRepository {
  Future<ActivateTotpResponse> activateTotp(String totp);
  Future<GenerateTotpResponse> generateTotp();
}
