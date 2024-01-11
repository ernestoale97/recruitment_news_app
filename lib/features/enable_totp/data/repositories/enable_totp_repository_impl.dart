import 'package:recruitment/core/resources/activate_totp_response.dart';
import 'package:recruitment/core/resources/generate_totp_response.dart';

import '../../domain/repositories/enable_totp_repository.dart';
import '../data_sources/enable_totp_data_source.dart';

class EnableTotpRepositoryImpl implements EnableTotpRepository {
  final EnableTotpDataSource _enableTotpDataSource;
  const EnableTotpRepositoryImpl(this._enableTotpDataSource);

  @override
  Future<ActivateTotpResponse> activateTotp(String totp) {
    return _enableTotpDataSource.activateTotp(totp);
  }

  @override
  Future<GenerateTotpResponse> generateTotp() {
    return _enableTotpDataSource.generateTotp();
  }
}