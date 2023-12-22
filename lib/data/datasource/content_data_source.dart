import 'package:main/data/dto/item_content_dto.dart';
import 'package:main/data/services/content_services.dart';

abstract class ContentRemoteDataSource {
  Future<List<ItemContentDTO>> fetchInsight();
}

class ContentRemoteDataSourceImpl extends ContentRemoteDataSource {
  final ContentServices _services;

  ContentRemoteDataSourceImpl(this._services);

  @override
  Future<List<ItemContentDTO>> fetchInsight() async {
    final response = await _services.fetchInsight();
    final postsRes = response.data['posts'] as List;

    return postsRes.map((e) => ItemContentDTO.fromJson(e)).toList();
  }
}
