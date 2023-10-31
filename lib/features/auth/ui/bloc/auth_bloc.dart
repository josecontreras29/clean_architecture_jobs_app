import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-core/usecases/auth/registration/registration_data.dart';
import '../../../../../-core/params/auth/login_params.dart';

import '../../domain/usecases/generate_token.dart';
import '../../domain/usecases/registration_user.dart';
import '../../domain/usecases/validate_token.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {required GenerateToken generateToken,
      required ValidateToken validateToken,
      required RegistrationUser registrationUser})
      : _generateToken = generateToken,
        _validateToken = validateToken,
        _registrationUser = registrationUser,
        super(LoginInitial()) {
    on<InitialEvent>(initialEvent);
    on<RegisterEvent>(registerEvent);
    on<ForgottenPaswordEvent>(forgottenPaswordEvent);
    on<SignIn>(signIn);
    on<SignUp>(signUp);
  }
  final GenerateToken _generateToken;
  final ValidateToken _validateToken;
  final RegistrationUser _registrationUser;

  void initialEvent(InitialEvent event, Emitter<AuthState> emit) {
    emit(LoginInitial());
  }

  void registerEvent(RegisterEvent event, Emitter<AuthState> emit) {
    emit(RegisterInitial());
  }

  void forgottenPaswordEvent(
      ForgottenPaswordEvent event, Emitter<AuthState> emit) {
    emit(ForgottenPasswordInitial());
  }

  void signIn(SignIn event, Emitter<AuthState> emit) async {
    emit(Loading());
    final resultToken = await _generateToken
        .call(LoginParams(user: event.user, password: event.password));
    final checkingToken =
        await _validateToken.call(TokenParams(token: resultToken.token));
    if (checkingToken.isValid) {
      emit(AuthPassed(token: resultToken.token));
    } else {
      emit(AuthDenied());
    }
  }

  void signUp(SignUp event, Emitter<AuthState> emit) async {
    emit(Loading());
    final resultRegister = await _registrationUser.call(RegistrationData(
        nombre: event.registrationData.nombre,
        apellido: event.registrationData.apellido,
        correo: event.registrationData.correo,
        celular: event.registrationData.celular,
        direccion: event.registrationData.direccion));
    if (resultRegister.created) {
      emit(UserRegistered());
    } else {
      emit(UserNotRegistered());
    }
  }
}
