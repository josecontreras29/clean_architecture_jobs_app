
import '../../../../-core/usecases/auth/registration/registration_data.dart';
import '../models/registration_model.dart';
import 'source/http.dart';

abstract class RegistrationDataSource {
  Future<RegistrationModel> createUser(RegistrationData registration);
}

class RegistrationDataSourceImpl implements RegistrationDataSource {
  final ClientHttp client;

  RegistrationDataSourceImpl({required this.client});
  @override
  Future<RegistrationModel> createUser(RegistrationData registration) async {
    // final response = await client.post(
    //     url: "https://127.0.0.1:3000/api/v1/auth/createUser",
    //     body: {"authorizationToken":authorizationToken,
    //            "registrationData":registrationData},
    await Future.delayed(const Duration(seconds: 2));
    // if (response.code == 200) {
    return RegistrationModel.fromJson({"created": true});
    // } else {
    // throw Exception("Error ${response.code}");
    // }
  }
}
