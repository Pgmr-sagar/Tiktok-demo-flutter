import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tiktok_demo/network/api_url.dart';
import 'package:tiktok_demo/network/network_request.dart';

class ApiService {
  final Dio dio;

  const ApiService._(
    this.dio,
  );

  factory ApiService() {
    final dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    return ApiService._(dio);
  }

  Future<Response<T>> request<T>({
    required ApiUrl apiUrl,
    required RequestMethod method,
    data,
    Map<String, String>? additionalHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {

    final headers = await _getHeaders(additionalHeaders: additionalHeaders);

    return dio.request(
      apiUrl.string,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.string,
        headers: headers,
      ),
    );
  }

  Future<Map<String, String>> _getHeaders({
    Map<String, String>? additionalHeaders,
  }) async {
    final Map<String, String> headers = {};

    headers['Content-Type'] = 'application/json';
    headers['Accept'] = '*/*';

    if (additionalHeaders != null && additionalHeaders.isNotEmpty) {
      headers.addAll(additionalHeaders);
    }
    return headers;
  }
}

extension RequestMethodValue on RequestMethod {
  String get value => getEnumValue(this).toUpperCase();
}

String getEnumValue(e) => e.toString().split('.').last;
