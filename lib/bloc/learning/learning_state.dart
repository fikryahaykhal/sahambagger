part of 'learning_cubit.dart';

@freezed
class LearningState with _$LearningState {
  const factory LearningState({
    required bool isInError,
    required String errorMsg,
    required bool isInInsightProgress,
    required bool isInElearningProgress,
    required List<ItemContentUiModel>? insightList,
    required List<ItemContentUiModel>? elearningList,
  }) = _LearnigState;

  factory LearningState.initial() => const LearningState(
        isInError: false,
        errorMsg: '',
        isInElearningProgress: false,
        isInInsightProgress: false,
        insightList: null,
        elearningList: null,
      );
}
