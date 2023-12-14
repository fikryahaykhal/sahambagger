part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required String email,
    required String password,
    required bool isInError,
    required String errorMsg,
    required bool? isLoggedIn,
    required bool isInProgress,
    required bool? isInEmailValid,
    required bool? isInEmailFormat,
    required bool? isInPasswordValid,
  }) = _LoginState;

  const LoginState._();

  factory LoginState.initial() => LoginState(
        email: '',
        password: '',
        isInError: false,
        errorMsg: '',
        isLoggedIn: null,
        isInProgress: false,
        isInEmailValid: null,
        isInEmailFormat: null,
        isInPasswordValid: null,
      );
}
