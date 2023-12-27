part of 'survey_cubit.dart';

@freezed
class SurveyState with _$SurveyState {
  factory SurveyState({
    required bool isInError,
    required String errorMsg,
    required bool isInProgress,
    required String source,
    required String ability,
    required String needs,
    required String risk,
    required String sahamPrefs,
    required String portofolio,
    required bool isInToSecondForm,
    required bool isInToSubmit,
    required bool isInSubmitSuccess,
  }) = _SurveyState;

  SurveyState._();

  factory SurveyState.initial() => SurveyState(
      isInError: false,
      errorMsg: '',
      isInProgress: false,
      source: '',
      ability: '',
      needs: '',
      risk: '',
      sahamPrefs: '',
      portofolio: '',
      isInToSecondForm: false,
      isInToSubmit: false,
      isInSubmitSuccess: false);
}
