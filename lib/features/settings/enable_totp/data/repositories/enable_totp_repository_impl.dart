import 'package:recruitment/features/settings/enable_totp/domain/repositories/enable_totp_repository.dart';
import 'package:recruitment/features/settings/enable_totp/data/data_sources/enable_totp_data_source.dart';
import '../../domain/entities/activate_totp_response.dart';
import '../../domain/entities/generate_totp_response.dart';

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