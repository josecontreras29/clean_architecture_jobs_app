import 'dart:convert';

import '../../../../-core/params/auth/login_params.dart';
import '../../../../-core/usecases/auth/login/validator_token.dart';
import '../../domain/entities/login.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginImpl implements LoginRepository {
  final LoginDataSource remoteDataSource;

  LoginImpl({required this.remoteDataSource});

  @override
  Future<Login> generateToken(LoginParams credentials) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('${credentials.user}:${credentials.password}'))}';

      return await remoteDataSource.generateToken(basicAuth);
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<VerifyToken> validateToken(TokenParams params) async {
    try {
      return await remoteDataSource.validateToken(params.token);
    } catch (error) {
      throw error.toString();
    }
  }
}
