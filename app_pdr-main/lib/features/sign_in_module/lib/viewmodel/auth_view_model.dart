import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:sing_module/repository/auth_repository.dart';
import '../repository/models/auth_response.dart';

part './auth_state.dart';

class SigninViewModel extends Cubit<AuthState> {
  AuthRepository repository;

  SigninViewModel(this.repository) : super(AuthInitial());

  Future auth(String email, String password) async {
    try {
      emit(AuthLoading());
      AuthResponse response = await repository.auth(email, password);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(const AuthError("Erro ao tentar fazer login"));
    }
  }
}
