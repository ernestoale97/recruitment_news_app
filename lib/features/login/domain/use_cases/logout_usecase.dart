import 'package:recruitment/features/login/domain/repositories/login_repository.dart';

class LogoutUseCase {
  final LoginRepository repository;
  LogoutUseCase(this.repository);

  Future<void> call() async {
    return await repository.logout();
  }
}
