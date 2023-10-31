
import '../../../../-core/params/auth/login_params.dart';
import '../../../../-core/usecases/auth/login/validator_token.dart';
import '../entities/login.dart';

abstract class LoginRepository {
  Future<Login> generateToken(LoginParams credentials);
  Future<VerifyToken> validateToken(TokenParams params);
}
