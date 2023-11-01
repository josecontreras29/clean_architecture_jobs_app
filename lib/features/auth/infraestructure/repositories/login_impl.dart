import 'dart:convert';

import '../../../../-core/params/login_params.dart';
// import '../../domain/entities/verify_token.dart';
import '../../domain/entities/token_auth.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginImpl implements LoginRepository {
  final LoginDataSource remoteDataSource;

  LoginImpl({required this.remoteDataSource});

  @override
  Future<TokenAuth> generateToken(LoginParams credentials) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('${credentials.user}:${credentials.password}'))}';
     
      return await remoteDataSource.generateToken(basicAuth);
    } catch (error) {
      throw error.toString();
    }
  }

  // @override
  // Future<VerifyToken> validateToken(TokenParams params) async {
  //   try {
  //     return await remoteDataSource.validateToken(params.token);
  //   } catch (error) {
  //     throw error.toString();
  //   }
  // }
}
