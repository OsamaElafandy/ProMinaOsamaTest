import 'package:dio/dio.dart';

class DioHelper {
  static const String _url = 'https://technichal.prominaagency.com/api/';
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _url,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> apiGet({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      url,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response> apiPost({
    required String url,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await _dio.post(
      url,
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'application/json',
            },
      ),
      data: body,
    );
  }
}
