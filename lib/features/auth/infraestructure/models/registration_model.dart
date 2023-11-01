import '../../domain/entities/registration_status.dart';

class RegistrationModel extends RegistrationStatus {
  RegistrationModel({required super.created});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(created: json["created"]);
  }
}
