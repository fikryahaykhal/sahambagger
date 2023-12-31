import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:main/domain/uimodel/profile_ui_model.dart';
import 'package:main/domain/uimodel/user_ui_model.dart';
import 'package:main/injector.dart' as di;

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final _repository = di.locator<UserRepository>();

  ProfileCubit() : super(ProfileState.initial());

  void getCurrentUser() async {
    emit(state.copyWith(isInProgress: true, isInError: false));

    final result = await _repository.getCurrentUser();

    result.fold(
      (error) => emit(state.copyWith(
          isInProgress: false,
          isInError: true,
          errorMsg: error.message.toString())),
      (data) => emit(
        state.copyWith(
          isInProgress: false,
          isInError: false,
          data: data,
        ),
      ),
    );
  }

  void signOut() async {
    emit(state.copyWith(isInProgress: true, isInError: false));

    final result = await _repository.doSignOut();

    result.fold(
      (error) => emit(state.copyWith(
          isInProgress: false,
          isInError: true,
          errorMsg: error.message.toString())),
      (data) => emit(
        state.copyWith(
          isInProgress: false,
          isInError: false,
          isInSignOut: true,
        ),
      ),
    );
  }
}
