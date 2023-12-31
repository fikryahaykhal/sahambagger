import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:main/utilities/strings.dart';
import 'package:main/injector.dart' as di;

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final _repository = di.locator<UserRepository>();

  RegisterCubit() : super(RegisterState.initial());

  void setName(String text) {
    emit(state.copyWith(name: text));
  }

  void setAge(int? value) {
    emit(state.copyWith(age: value ?? 0));
  }

  void setUsername(String text) {
    emit(state.copyWith(username: text));
  }

  void setEmail(String text) {
    emit(state.copyWith(email: text));
  }

  void setPhoneNumber(String text) {
    emit(state.copyWith(phoneNumber: text));
  }

  void setPassword(String text) {
    emit(state.copyWith(password: text));
  }

  void doSignUp() async {
    final isValidated = validated();

    clearValidation();

    if (isValidated) {
      emit(state.copyWith(isInProgress: true, isInError: false));

      final result = await _repository.doSignUp(
        state.name,
        state.age,
        state.phoneNumber,
        state.username,
        state.email,
        state.password,
      );

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
            isInError: false,
            isInSignUpSuccess: true,
          ),
        ),
      );
    }
  }

  bool validated() {
    if (state.name.isEmpty == true) {
      emit(state.copyWith(isInNameInvalidate: true));
      return false;
    }

    if (state.age == 0) {
      emit(state.copyWith(isInAgeInvalidate: true));
      return false;
    }

    if (state.phoneNumber.isEmpty == true) {
      emit(state.copyWith(isInPhoneInvalidate: true));
      return false;
    }

    if (state.username.isEmpty == true) {
      emit(state.copyWith(isInUsernameInvalidate: true));
      return false;
    }

    if (state.email.isEmpty == true) {
      emit(state.copyWith(isInEmailInvalidate: true));
      return false;
    }

    if (state.email.isEmail() == false) {
      emit(state.copyWith(isInEmailFormatInvalidate: true));
      return false;
    }

    if (state.password.isEmpty == true) {
      emit(state.copyWith(isInPasswordInvalidate: true));
      return false;
    }

    return true;
  }

  void clearValidation() {
    emit(
      state.copyWith(
        isInNameInvalidate: false,
        isInAgeInvalidate: false,
        isInPhoneInvalidate: false,
        isInUsernameInvalidate: false,
        isInEmailInvalidate: false,
        isInEmailFormatInvalidate: false,
        isInPasswordInvalidate: false,
        isInError: false,
      ),
    );
  }
}
