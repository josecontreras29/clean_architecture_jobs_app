 import '../../../../-core/usecases/auth/registration/registration_data.dart';
import '../entities/registration.dart';

abstract class RegistrationRepository {
  Future<Registration> createUser(RegistrationData userData);
}
