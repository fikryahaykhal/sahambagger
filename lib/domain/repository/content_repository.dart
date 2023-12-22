import 'package:dartz/dartz.dart';
import 'package:main/core/failure.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';

abstract class ContentRepository {
  Future<Either<Failure, List<ItemContentUiModel>>> getInsightContent();
}
