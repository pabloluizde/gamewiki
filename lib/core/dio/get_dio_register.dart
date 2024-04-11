import 'package:dio/dio.dart';

class DioOptionsSetup {
  final Dio dio = Dio();
  // Dio configurations

  Dio getInstance() {
    return dio;
  }
}
