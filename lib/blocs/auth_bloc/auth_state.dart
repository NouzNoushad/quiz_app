part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthLoadingState extends AuthState {}

final class AuthenticatedState extends AuthState {
  final User user;
  const AuthenticatedState(this.user);

  @override
  List<Object> get props => [user];
}

final class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState();

  @override
  List<Object> get props => [];
}

final class AuthErrorState extends AuthState {
  final String error;
  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}
