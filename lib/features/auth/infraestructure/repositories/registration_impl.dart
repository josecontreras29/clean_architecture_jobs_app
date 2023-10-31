import '../../../../-core/usecases/auth/registration/registration_data.dart';
import '../../domain/entities/registration.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasource/registration_datasource.dart';

class RegistrationImpl implements RegistrationRepository {
  final RegistrationDataSource remoteDataSource;

  RegistrationImpl({required this.remoteDataSource});
  @override
  Future<Registration> createUser(RegistrationData userData) async {
    try {
      return await remoteDataSource.createUser(userData);
    } catch (error) {
      throw error.toString();
    }
  }
}
