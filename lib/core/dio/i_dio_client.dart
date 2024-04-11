import 'package:dio/dio.dart';
import 'package:game_wiki_app/core/dio/enum/dio_methods.dart';
import 'package:game_wiki_app/core/dio/models/dio_model.dart';

abstract class IDioClient {
  Future<DioResponse> request({
    required String url,
    required DioMethod method,
    Map<String, dynamic>? params,
    dynamic body,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
  });
}
