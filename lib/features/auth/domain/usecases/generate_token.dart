 

import '../../../../../-core/params/auth/login_params.dart';
import '../../../../../-core/usecases/usecase.dart';
import '../entities/login.dart';
import '../repositories/login_repository.dart';


class GenerateToken extends UseCase<Login, LoginParams> {
  final LoginRepository repository;

  GenerateToken({required this.repository});

  @override
  Future<Login> call(LoginParams params) async {
    return await repository.generateToken(params);
  }
}
