import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retry/retry.dart';

import '../utils/utility.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _addLoggerInterceptor();
  }

  void _addLoggerInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        enabled: kDebugMode,
        filter: (options, args) {
          // won't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  /// **GET Request**
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      //if you want to cancel the api call then pass the cancel token.
      final r = const RetryOptions(maxAttempts: 3);
      final Response response = await r.retry(
        () => _dio.get(
          endpoint,
          queryParameters: queryParams,
          cancelToken: cancelToken,
          options: Options(responseType: responseType),
        ),
        // Retry on DioException or TimeoutException
        retryIf: (e) {
          if (e is DioException) {
            if (CancelToken.isCancel(e)) {
              return false; // Skip retry if request was cancelled
            }
            return isConnectionTimedOut(e); // Retry if timeout
          }
          return false; // Not a DioException → don't retry
        },
      );

      return response;
    } on DioException catch (e) {
      Utility.showPrints(message: "❌ error in endpoint => $endpoint");
      if (e.response != null) {
        Utility.showPrints(
          message:
              "❌ error status code => ${e.response!.statusCode.toString()}",
        );
      }

      rethrow;
    } catch (e) {
      Utility.showPrints(message: "GET request failed: $e");
      rethrow;
    }
  }

  Future<bool> isConnectionTimedOut(Exception e) async {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return true;
      }
    }
    if (e is TimeoutException) {
      return true;
    }
    return false;
  }
}
