import 'package:recruitment/features/signup/data/data_sources/signup_data_source.dart';
import 'package:recruitment/features/signup/domain/entities/signup_form.dart';
import 'package:recruitment/features/signup/domain/repositories/signup_repository.dart';

import '../../domain/entities/signup_response.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDataSource _signupDataSource;
  const SignupRepositoryImpl(this._signupDataSource);

  @override
  Future<SignupResponse> signup(SignupFormEntity signupFormEntity) {
    return _signupDataSource.signup(signupFormEntity);
  }
}
