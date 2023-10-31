 

import '../../../../-core/usecases/auth/registration/registration_data.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/registration.dart';
import '../repositories/registration_repository.dart';

class RegistrationUser extends UseCase<Registration, RegistrationData> {
  final RegistrationRepository repository;
  RegistrationUser({required this.repository});
  @override
  Future<Registration> call(RegistrationData params) async {
    return await repository.createUser(params);
  }
}
