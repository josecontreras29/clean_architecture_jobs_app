 
import 'package:get_it/get_it.dart';

import 'features/auth/domain/repositories/login_repository.dart';
import 'features/auth/domain/repositories/registration_repository.dart';
import 'features/auth/domain/usecases/generate_token.dart';
import 'features/auth/domain/usecases/registration_user.dart';
import 'features/auth/domain/usecases/validate_token.dart';
import 'features/auth/infraestructure/datasource/login_datasource.dart';
import 'features/auth/infraestructure/datasource/registration_datasource.dart';
import 'features/auth/infraestructure/datasource/source/http.dart';
import 'features/auth/infraestructure/repositories/login_impl.dart';
import 'features/auth/infraestructure/repositories/registration_impl.dart';
import 'features/auth/ui/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // HTTP
  sl.registerSingleton<ClientHttp>(ClientHttp());

  // Dependencies
  sl.registerSingleton<LoginDataSource>(LoginDataSourceImpl(client: sl()));
  sl.registerSingleton<RegistrationDataSource>(
      RegistrationDataSourceImpl(client: sl()));

  sl.registerSingleton<LoginRepository>(LoginImpl(remoteDataSource: sl()));
  sl.registerSingleton<RegistrationRepository>(
      RegistrationImpl(remoteDataSource: sl()));

  // UseCases
  sl.registerSingleton<GenerateToken>(GenerateToken(repository: sl()));
  sl.registerSingleton<RegistrationUser>(RegistrationUser(repository: sl()));
  sl.registerSingleton<ValidateToken>(ValidateToken(repository: sl()));

  // Blocs
  sl.registerSingleton<AuthBloc>(AuthBloc(
      generateToken: sl(), validateToken: sl(), registrationUser: sl()));
}
