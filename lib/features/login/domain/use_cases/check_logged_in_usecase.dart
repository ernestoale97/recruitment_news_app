import 'package:recruitment/features/login/domain/entities/user_login_entity.dart';
import 'package:recruitment/features/login/domain/repositories/login_repository.dart';
import 'package:jwt_decode/jwt_decode.dart';

class CheckLoggedInUseCase {
  final LoginRepository repository;
  CheckLoggedInUseCase(this.repository);

  Future<UserLoginEntity?> call() async {
    String? token = await repository.getToken();
    String? email = await repository.getEmail();
    if (token != null && !Jwt.isExpired(token)) {
      return UserLoginEntity(
          email:  email,
          token: token
      );
    }
    return null;
  }
}
