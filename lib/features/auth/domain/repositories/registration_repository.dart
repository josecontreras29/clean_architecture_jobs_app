import '../entities/registration_status.dart';
import '../entities/registration_data_form.dart';

abstract class RegistrationRepository {
  Future<RegistrationStatus> createUser(RegistrationDataForm userData);
}
