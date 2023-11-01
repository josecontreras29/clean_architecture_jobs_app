import '../../domain/entities/registration_status.dart';
import '../../domain/entities/registration_data_form.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasource/registration_datasource.dart';

class RegistrationImpl implements RegistrationRepository {
  final RegistrationDataSource remoteDataSource;

  RegistrationImpl({required this.remoteDataSource});
  @override
  Future<RegistrationStatus> createUser(RegistrationDataForm userData) async {
    try {
      return await remoteDataSource.createUser(userData);
    } catch (error) {
      throw error.toString();
    }
  }
}
