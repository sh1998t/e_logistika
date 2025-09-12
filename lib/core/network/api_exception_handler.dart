import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

class ApiExceptionHandler {
  static Exception handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(message: 'Connection timeout');
      
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Server error';
        
        if (statusCode == 401) {
          return AuthException(message: message, code: statusCode);
        } else if (statusCode == 422) {
          return ValidationException(message: message);
        } else {
          return ServerException(message: message, code: statusCode);
        }
      
      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request cancelled');
      
      case DioExceptionType.connectionError:
        return const NetworkException(message: 'No internet connection');
      
      case DioExceptionType.badCertificate:
        return const NetworkException(message: 'Certificate error');
      
      case DioExceptionType.unknown:
        return NetworkException(message: error.message ?? 'Unknown error');
    }
  }
}
