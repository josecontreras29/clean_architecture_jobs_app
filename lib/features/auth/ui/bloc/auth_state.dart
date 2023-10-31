class AuthState {
  const AuthState();
}

class LoginInitial extends AuthState {}

class Loading extends AuthState {}

class AuthDenied extends AuthState {}

class AuthPassed extends AuthState {
  final String token;
  const AuthPassed({required this.token});
}

class RegisterInitial extends AuthState {}

class UserRegistered extends AuthState {}

class UserNotRegistered extends AuthState {}

class ForgottenPasswordInitial extends AuthState {}

// class UserRegistered extends AuthState {}

// class UserNotRegistered extends AuthState {}
