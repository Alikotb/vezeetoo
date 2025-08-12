
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio()  {
    Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout;
      addDioInterceptor();
      return dio!;
    }else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ),
    );
  }

  // Add methods to create and configure Dio instances here
  // For example:
  // Dio createDio() {
  //   final dio = Dio();
  //   // Configure dio instance
  //   return dio;
  // }
}