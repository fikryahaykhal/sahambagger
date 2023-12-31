import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main/domain/repository/auth_repository.dart';
import 'package:main/injector.dart' as di;

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final _repository = di.locator<AuthRepository>();
  LoginCubit() : super(LoginState.initial());

  void changeEmail(String email) {
    emit(state.copyWith(
        email: email, isInEmailValid: null, isInEmailFormat: null));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password, isInPasswordValid: null));
  }

  void sendLoginData() async {
    final email = state.email;
    final password = state.password;

    if (email.isEmpty) {
      emit(
        state.copyWith(isInProgress: false, isInEmailValid: false),
      );
    } else if (password.isEmpty) {
      emit(
        state.copyWith(isInProgress: false, isInPasswordValid: false),
      );
    } else {
      _showLoading();

      debugPrint('Username : $email, Pass : $password');

      final result = await _repository.doLogin(email, password);

      result.fold(
        (error) => emit(
          state.copyWith(
            isInProgress: false,
            isInError: true,
            errorMsg: error.message.toString(),
          ),
        ),
        (data) => emit(
          state.copyWith(
            isInProgress: false,
            isLoggedIn: data,
          ),
        ),
      );
    }

    reset();
  }

  void _showLoading() {
    emit(
      state.copyWith(
        isInProgress: true,
        isInError: false,
        isLoggedIn: null,
      ),
    );
  }

  void sendGoogleLogin() async {
    _showLoading();

    final result = await _repository.doGoogleLogin();

    result.fold(
      (error) {
        emit(
          state.copyWith(
            isInProgress: false,
            isInError: true,
            errorMsg: error.message.toString(),
          ),
        );
      },
      (data) => emit(
        state.copyWith(
          isInProgress: false,
          isLoggedIn: data,
        ),
      ),
    );

    reset();
  }

  void reset() {
    emit(
      state.copyWith(
        isInProgress: false,
        isInError: false,
        isLoggedIn: null,
      ),
    );
  }
}
