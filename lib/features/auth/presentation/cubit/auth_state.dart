abstract class AuthState {}

class AuthInitailState extends AuthState {}

class AuthLodingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({required this.message});
}
