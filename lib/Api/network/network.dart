part of '../api.dart';

class NetworkHelper {
  static final Dio _dio = Dio();
  static const String _baseUrl = 'https://dummyjson.com/users';
  static Future<Response> get(String path) => _dio.get(
        _baseUrl + path,
      );

  static Future<Response> post(
    String path,
    dynamic data,
  ) {
    return _dio.post(
      _baseUrl,
      data: data,
    );
  }
}
