import '../../domain/entities/token_auth.dart';

class GenerateTokenModel extends TokenAuth {
  GenerateTokenModel({required super.token});

  factory GenerateTokenModel.fromJson(Map<String, dynamic> json) {
    return GenerateTokenModel(token: json["token"]);
  }
}
