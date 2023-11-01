// import 'package:flutter/services.dart';
// import 'package:frontside/domain/entities/response_from_api.dart';

// import 'package:clean_architecture_jobs_app/features/auth/domain/entities/token_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/generate_token_model.dart';
// import '../models/validate_token_login_model.dart';
import '../../../../-core/datasources/http.dart';

abstract class LoginDataSource {
  Future<GenerateTokenModel> generateToken(String credentialsEncrypt);
  // Future<ValidateTokenModel> validateToken(String authorizationToken);
}

class LoginDataSourceImpl implements LoginDataSource {
  final ClientHttp client;
  final SharedPreferences sharedPreferences;

  LoginDataSourceImpl({required this.client, required this.sharedPreferences});
  @override
  Future<GenerateTokenModel> generateToken(String credentialsEncrypt) async {
    // final config =
    //     await jsonDecode(await rootBundle.loadString("../config.json"));

    // final response = await client.get(
    //     url: "https://127.0.0.1:3000/api/v1/auth/generateToken",
    //     headers: {'Authorization': credentialsEncrypt});
    
    final response = {"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ8"};

    ///[response.code == 200]///
    if (true) {
      /// DELAY TO SIMULATE THE GET METHOD
      await Future.delayed(const Duration(seconds: 2));

      GenerateTokenModel token = GenerateTokenModel.fromJson(response);
      await sharedPreferences.setString('token', token.token);
      return token;
    } else {
      throw Exception("Error  ");
      // throw Exception("Error ${response.code}");
    }
  }

  // @override
  // Future<ValidateTokenModel> validateToken(String authorizationToken) async {
  // final response = await client.post(
  //     url: "https://127.0.0.1:3000/api/v1/auth/generateToken", body: authorizationToken);
  // if (response.code == 200) {
  // return ValidateTokenModel.fromJson({"isValid": true});
  // } else {
  //   throw Exception("Error ${response.code}");
  // }
//   }
}
