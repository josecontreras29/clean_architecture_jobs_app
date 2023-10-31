import '../../../../-core/usecases/auth/registration/registration_data.dart';

class AuthEvent {
  AuthEvent();
}

class InitialEvent extends AuthEvent {}

class SignIn extends AuthEvent {
  final String user;
  final String password;

  SignIn({required this.user, required this.password});
}

class RegisterEvent extends AuthEvent {}

class SignUp extends AuthEvent {
  final RegistrationData registrationData;
  SignUp({required this.registrationData});
}

class ForgottenPaswordEvent extends AuthEvent {}

class SendRecoveryEmail extends AuthEvent {
  // final RegistrationData registrationData;
  SendRecoveryEmail(/*{required this.registrationData}*/);
}
