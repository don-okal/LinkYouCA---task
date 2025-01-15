import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'ApiException: $message';
}

class ApiService {
  late Dio _dio;
  final String _baseUrl = Constants.baseUrl;
  final String _accessToken =
      'YOUR_ACCESS_TOKEN'; // Consider moving to secure storage

  ApiService() {
    _initializeDio();
  }

  void _initializeDio() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
      validateStatus: (status) {
        return status != null && status < 500;
      },
    );

    _dio = Dio(options);
    _addInterceptors();
  }

  void _addInterceptors() {
    // Logger interceptor for development
    // if (Constants.isDevelopment) {
    //   _dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //     responseBody: true,
    //     error: true,
    //     compact: true,
    //   ));
    // }

    // Auth and error handling interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $_accessToken';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.data is Map && response.data['success'] == false) {
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                error: response.data['message'] ?? 'Unknown error occurred',
              ),
            );
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Handle token refresh here if needed
            // await _refreshToken();
            // return handler.resolve(await _retry(error.requestOptions));
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> _handleRequest(
      Future<Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException(
        message: 'Unexpected error occurred: $e',
        statusCode: 500,
      );
    }
  }

  ApiException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message:
              'Connection timed out. Please check your internet connection.',
          statusCode: 408,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: 'No internet connection.',
          statusCode: 0,
        );
      case DioExceptionType.badResponse:
        return ApiException(
          message: e.response?.data?['message'] ?? 'Server error occurred',
          statusCode: e.response?.statusCode,
          data: e.response?.data,
        );
      default:
        return ApiException(
          message: 'An unexpected error occurred',
          statusCode: 500,
        );
    }
  }

  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return _handleRequest(() async {
      final String url = endpoint;
      return await _dio.get(
        url,
        queryParameters: queryParams,
      );
    });
  }

  Future<Response> postRaw(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    return _handleRequest(() async {
      return await _dio.post(endpoint, data: data);
    });
  }

  Future<Response> post(
    String endpoint,
  ) async {
    return _handleRequest(() async {
      String? data;
      return await _dio.post(endpoint, data: data);
    });
  }

  // Future<Response> uploadFile(
  //   String endpoint,
  //   String filePath, {
  //   Map<String, dynamic>? additionalData,
  // }) async {
  //   return _handleRequest(() async {
  //     final file = await MultipartFile.fromFile(
  //       filePath,
  //       filename: filePath.split('/').last,
  //     );

  //     final formData = FormData.fromMap({
  //       'file': file,
  //       ...?additionalData,
  //     });

  //     return await _dio.post(endpoint, data: formData);
  //   });
  // }

  Future<Response> deleteRequest(String endpoint) async {
    return _handleRequest(() async {
      final String url = endpoint;
      return await _dio.delete(url);
    });
  }
}
