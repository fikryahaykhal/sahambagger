import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio createClient(
  String baseUrl, {
  Map<String, dynamic>? headers,
  queryParams,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      validateStatus: (status) {
        final code = status;
        return code != null ? code < 400 : false;
      },
      headers: headers,
      queryParameters: queryParams,
    ),
  );

  dio.interceptors.add(
    PrettyDioLogger(
      maxWidth: 10000,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
    ),
  );

  return dio;
}
