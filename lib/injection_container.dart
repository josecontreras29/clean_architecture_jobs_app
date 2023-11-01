import 'package:clean_architecture_jobs_app/features/home/domain/repositories/home_repository.dart';
import 'package:clean_architecture_jobs_app/features/home/infraestructure/datasource/home_datasource.dart';
import 'package:clean_architecture_jobs_app/features/home/infraestructure/repositories/home_impl.dart';
import 'package:clean_architecture_jobs_app/features/home/ui/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/domain/repositories/login_repository.dart';
import 'features/auth/domain/repositories/registration_repository.dart';
import 'features/auth/domain/usecases/generate_token.dart';
import 'features/auth/domain/usecases/registration_user.dart';
// import 'features/auth/domain/usecases/validate_token.dart';
import 'features/auth/infraestructure/datasource/login_datasource.dart';
import 'features/auth/infraestructure/datasource/registration_datasource.dart';
import '-core/datasources/http.dart';
import 'features/auth/infraestructure/repositories/login_impl.dart';
import 'features/auth/infraestructure/repositories/registration_impl.dart';
import 'features/auth/ui/bloc/auth_bloc.dart';
import 'features/home/domain/usecases/get_jobs_usecase.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // HTTP
  sl.registerSingleton<ClientHttp>(ClientHttp());
  // SHARED PREFERENCES
  sl.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // Dependencies
  sl.registerSingleton<LoginDataSource>(
      LoginDataSourceImpl(client: sl(), sharedPreferences: sl()));
  sl.registerSingleton<RegistrationDataSource>(
      RegistrationDataSourceImpl(client: sl()));

  sl.registerSingleton<LoginRepository>(LoginImpl(remoteDataSource: sl()));
  sl.registerSingleton<RegistrationRepository>(
      RegistrationImpl(remoteDataSource: sl()));

  // UseCases
  sl.registerSingleton<GenerateToken>(GenerateToken(repository: sl()));
  sl.registerSingleton<RegistrationUser>(RegistrationUser(repository: sl()));
  // sl.registerSingleton<ValidateToken>(ValidateToken(repository: sl()));

  // Blocs
  sl.registerSingleton<AuthBloc>(AuthBloc(
      generateToken: sl(), /* validateToken: sl(),*/ registrationUser: sl()));
}

Future<void> initHomeDependencies() async {
  // Dependencies
  sl.registerSingleton<HomeDataSource>(
      HomeDataSourceImpl(client: sl(), sharedPreferences: sl()));

  sl.registerSingleton<HomeRepository>(HomeImpl(remoteDataSource: sl()));

// UseCases
  sl.registerSingleton<GetJobs>(GetJobs(repository: sl()));
  // Blocs
  sl.registerSingleton<HomeBloc>(HomeBloc(getJobs: sl()));
}
