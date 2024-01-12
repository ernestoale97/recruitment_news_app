import 'package:recruitment/features/login/domain/entities/login_response.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

import '../entities/login_form.dart';

class LogoutUseCase {
  final LoginRepository repository;
  LogoutUseCase(this.repository);

  Future<void> call() async {
    return await repository.logout();
  }
}
