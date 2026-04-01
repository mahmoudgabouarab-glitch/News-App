import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio) {
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
      endpoint,
      options: options,
      queryParameters: queryParameters,
    );

    return response.data;
  }
}
