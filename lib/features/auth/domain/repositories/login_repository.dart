import '../../../../-core/params/login_params.dart';
// import '../entities/verify_token.dart';
import '../entities/token_auth.dart';

abstract class LoginRepository {
  Future<TokenAuth> generateToken(LoginParams credentials);
  // Future<VerifyToken> validateToken(TokenParams params);
}
