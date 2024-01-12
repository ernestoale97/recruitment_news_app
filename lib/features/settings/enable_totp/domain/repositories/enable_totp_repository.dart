import 'package:recruitment/features/settings/enable_totp/data/models/activate_totp_response.dart';
import 'package:recruitment/features/settings/enable_totp/data/models/generate_totp_response.dart';

abstract class EnableTotpRepository {
  Future<ActivateTotpResponse> activateTotp(String totp);
  Future<GenerateTotpResponse> generateTotp();
}
