import '../../../../-core/params/login_params.dart';
import '../../../../../-core/usecases/usecase.dart';

import '../entities/token_auth.dart';
import '../repositories/login_repository.dart';

class GenerateToken extends UseCase<TokenAuth, LoginParams> {
  final LoginRepository repository;

  GenerateToken({required this.repository});

  @override
  Future<TokenAuth> call(LoginParams params) async {
    return await repository.generateToken(params);
  }
}
