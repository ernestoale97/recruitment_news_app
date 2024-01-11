import 'package:recruitment/core/resources/login_response.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

import '../entities/login_form.dart';

class CheckLoggedInUseCase {
  final LoginRepository repository;
  CheckLoggedInUseCase(this.repository);

  Future<String?> call() async {
    return await repository.getToken();
  }
}
