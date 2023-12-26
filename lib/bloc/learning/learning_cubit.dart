import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main/domain/repository/content_repository.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';
import 'package:main/injector.dart' as di;

part 'learning_state.dart';
part 'learning_cubit.freezed.dart';

class LearningCubit extends Cubit<LearningState> {
  final _repository = di.locator<ContentRepository>();

  LearningCubit() : super(LearningState.initial());

  void getInsight() async {
    _insightProgress();

    final result = await _repository.getInsightContent();

    result.fold(
      (error) => emit(
        state.copyWith(
          isInError: true,
          errorMsg: error.message.toString(),
        ),
      ),
      (data) => emit(state.copyWith(
        isInInsightProgress: false,
        insightList: data,
      )),
    );
  }

  void _insightProgress() {
    emit(state.copyWith(isInInsightProgress: true, insightList: null));
  }

  getELearning() async {}
}
