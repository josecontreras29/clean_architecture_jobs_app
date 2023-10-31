import '../../domain/entities/registration.dart';

class RegistrationModel extends Registration {
  RegistrationModel({required super.created   });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      created: json["created"],
    );
  }
}
