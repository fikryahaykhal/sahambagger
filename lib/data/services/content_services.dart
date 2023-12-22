import 'package:dio/dio.dart';

class ContentServices {
  final Dio _dio;

  ContentServices(this._dio);

  Future<Response> fetchInsight() {
    return _dio.get(
        '/content/posts?fields=title,url,feature_image,slug&filter=tag:free');
  }
}
