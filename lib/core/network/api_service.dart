import 'package:dio/dio.dart';
import 'package:news_app/core/network/api_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServise {
  final Dio _dio;
  ApiServise(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${ApiKeys.myToken}';
          return handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      "${ApiKeys.baseUrl}$endpoint",
      options: options,
      queryParameters: queryParameters,
    );

    return response.data;
  }
}
