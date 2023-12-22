import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:main/core/failure.dart';
import 'package:main/data/datasource/content_data_source.dart';
import 'package:main/data/mapper/mapper.dart';
import 'package:main/domain/repository/content_repository.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';

class ContentRepositoryImpl extends ContentRepository {
  final ContentRemoteDataSource _remoteDataSource;

  ContentRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ItemContentUiModel>>> getInsightContent() async {
    try {
      final response = await _remoteDataSource.fetchInsight();
      return right(response.map((e) => e.toUiModel()).toList());
    } on DioException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
