part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthIdle extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final AuthRespondModel respond;

  const LoginSuccess({required this.respond});

  @override
  List<Object> get props => [respond];
}

final class LoginError extends AuthState {
  final ApiErrorRespondModel respond;

  const LoginError({required this.respond});

  @override
  List<Object> get props => [respond];
}

final class RegisterSuccess extends AuthState {
  final AuthRespondModel respond;

  const RegisterSuccess({required this.respond});

  @override
  List<Object> get props => [respond];
}

final class RegisterError extends AuthState {
  final ApiErrorRespondModel respond;

  const RegisterError({required this.respond});

  @override
  List<Object> get props => [respond];
}

final class LogoutSuccess extends AuthState {}

final class LogoutError extends AuthState {
  final ApiErrorRespondModel respond;

  const LogoutError({required this.respond});

  @override
  List<Object> get props => [respond];
}
