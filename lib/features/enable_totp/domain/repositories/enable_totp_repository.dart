import 'package:recruitment/features/enable_totp/data/models/generate_totp_response.dart';

import '../../data/models/activate_totp_response.dart';

abstract class EnableTotpRepository {
  Future<ActivateTotpResponse> activateTotp(String totp);
  Future<GenerateTotpResponse> generateTotp();
}