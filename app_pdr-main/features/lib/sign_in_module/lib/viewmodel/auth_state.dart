part of 'auth_view_model.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}

class AuthSuccess extends AuthState {
  final AuthModel response;
  const AuthSuccess(this.response);
}
