import 'package:recruitment/core/resources/generate_totp_response.dart';

import '../../../../../core/resources/activate_totp_response.dart';

abstract class EnableTotpRepository {
  Future<ActivateTotpResponse> activateTotp(String totp);
  Future<GenerateTotpResponse> generateTotp();
}