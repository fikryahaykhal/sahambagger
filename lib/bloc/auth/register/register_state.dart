part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required bool isInError,
    required String errorMsg,
    required bool isInProgress,
    required String name,
    required int age,
    required String phoneNumber,
    required String email,
    required String username,
    required String password,
    required bool isInNameInvalidate,
    required bool isInAgeInvalidate,
    required bool isInPhoneInvalidate,
    required bool isInUsernameInvalidate,
    required bool isInEmailInvalidate,
    required bool isInEmailFormatInvalidate,
    required bool isInPasswordInvalidate,
    required bool isInSignUpSuccess,
  }) = _RegisterState;

  RegisterState._();

  factory RegisterState.initial() => RegisterState(
        isInError: false,
        errorMsg: '',
        isInProgress: false,
        name: '',
        age: 0,
        phoneNumber: '',
        email: '',
        username: '',
        password: '',
        isInNameInvalidate: false,
        isInAgeInvalidate: false,
        isInPhoneInvalidate: false,
        isInUsernameInvalidate: false,
        isInEmailInvalidate: false,
        isInEmailFormatInvalidate: false,
        isInPasswordInvalidate: false,
        isInSignUpSuccess: false,
      );
}
