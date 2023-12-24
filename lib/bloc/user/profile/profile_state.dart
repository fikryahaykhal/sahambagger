part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    required bool isInError,
    required String errorMsg,
    required bool isInProgress,
    required UserUiModel? data,
    required bool isInSignOut,
  }) = _ProfileState;

  const ProfileState._();

  factory ProfileState.initial() => ProfileState(
        isInError: false,
        errorMsg: '',
        isInProgress: false,
        data: null,
        isInSignOut: false,
      );
}
