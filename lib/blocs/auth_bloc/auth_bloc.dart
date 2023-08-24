import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(const UnAuthenticatedState()) {
    on<SignUpEvent>(signUpUser);
    on<SignInEvent>(signInUser);
    on<SignInWithGoogleEvent>(signInWithGoogle);
    on<SignOutEvent>(signOutUser);
  }

  FutureOr<void> signUpUser(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authRepository.createUserAccount(
          name: event.name, email: event.email, password: event.password);
      emit(AuthenticatedState(FirebaseAuth.instance.currentUser!));
    } catch (error) {
      emit(AuthErrorState(error.toString()));
      emit(const UnAuthenticatedState());
    }
  }

  FutureOr<void> signInUser(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authRepository.signInUser(
          email: event.email, password: event.password);
      emit(AuthenticatedState(FirebaseAuth.instance.currentUser!));
    } catch (error) {
      emit(AuthErrorState(error.toString()));
      emit(const UnAuthenticatedState());
    }
  }

  FutureOr<void> signInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authRepository.signInWithGoogle();
      emit(AuthenticatedState(FirebaseAuth.instance.currentUser!));
    } catch (error) {
      emit(AuthErrorState(error.toString()));
      emit(const UnAuthenticatedState());
    }
  }

  FutureOr<void> signOutUser(
      SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authRepository.signOut();
    } catch (error) {
      emit(AuthErrorState(error.toString()));
      emit(const UnAuthenticatedState());
    }
  }
}
