import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:main/injector.dart' as di;

part 'survey_state.dart';
part 'survey_cubit.freezed.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final _repository = di.locator<UserRepository>();
  SurveyCubit() : super(SurveyState.initial());

  void setSource(String? value) {
    emit(state.copyWith(source: value ?? ''));
    _validateFirstForm();
  }

  void setAbility(String? value) {
    emit(state.copyWith(ability: value ?? ''));
    _validateFirstForm();
  }

  void setNeeds(String? value) {
    emit(state.copyWith(needs: value ?? ''));
    _validateFirstForm();
  }

  void _validateFirstForm() {
    final value = state.source.isNotEmpty &&
        state.needs.isNotEmpty &&
        state.ability.isNotEmpty;
    emit(state.copyWith(isInToSecondForm: value));
  }

  void setRisk(String? value) {
    emit(state.copyWith(risk: value ?? ''));
    _validateSubmit();
  }

  void setSahamPrefs(String? value) {
    emit(state.copyWith(sahamPrefs: value ?? ''));
    _validateSubmit();
  }

  void setPortofolio(String? value) {
    emit(state.copyWith(portofolio: value ?? ''));
    _validateSubmit();
  }

  void _validateSubmit() {
    final value = state.portofolio.isNotEmpty &&
        state.sahamPrefs.isNotEmpty &&
        state.risk.isNotEmpty;
    emit(state.copyWith(isInToSubmit: value));
  }

  void submit() async {
    emit(state.copyWith(isInProgress: true, isInError: false));

    final result = await _repository.doSubmitSurvey(
      state.source,
      state.ability,
      state.needs,
      state.risk,
      state.sahamPrefs,
      state.portofolio,
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
          isInSubmitSuccess: true,
        ),
      ),
    );
  }
}
