import 'package:recruitment/features/login/domain/repositories/login_repository.dart';
import 'package:jwt_decode/jwt_decode.dart';

class CheckLoggedInUseCase {
  final LoginRepository repository;
  CheckLoggedInUseCase(this.repository);

  Future<bool> call() async {
    String? token = await repository.getToken();
    if (token == null) {
      return false;
    }
    return !Jwt.isExpired(token);
  }
}
