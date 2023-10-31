// import 'package:flutter/services.dart';
// import 'package:frontside/domain/entities/response_from_api.dart';

import '../models/login_model.dart';
import '../models/validate_token_login_model.dart';
import 'source/http.dart';

abstract class LoginDataSource {
  Future<LoginModel> generateToken(String credentialsEncrypt);
  Future<ValidateTokenModel> validateToken(String authorizationToken);
}

class LoginDataSourceImpl implements LoginDataSource {
  final ClientHttp client;

  LoginDataSourceImpl({required this.client});
  @override
  Future<LoginModel> generateToken(String credentialsEncrypt) async {
    // final config =
    //     await jsonDecode(await rootBundle.loadString("../config.json"));

    // final response = await client.get(
    //     url: "https://127.0.0.1:3000/api/v1/auth/generateToken",
    //     headers: {'Authorization': credentialsEncrypt});
    await Future.delayed(const Duration(seconds: 2));
    // if (response.code == 200) {
    return LoginModel.fromJson(
        {"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"});
    // } else {
    // throw Exception("Error ${response.code}");
    // }
  }

  @override
  Future<ValidateTokenModel> validateToken(String authorizationToken) async {
    // final response = await client.post(
    //     url: "https://127.0.0.1:3000/api/v1/auth/generateToken", body: authorizationToken);
    // if (response.code == 200) {
    return ValidateTokenModel.fromJson({"validate": true});
    // } else {
    //   throw Exception("Error ${response.code}");
    // }
  }
}
