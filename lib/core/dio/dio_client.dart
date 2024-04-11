import 'package:dio/dio.dart';
import 'package:game_wiki_app/core/dio/enum/dio_methods.dart';
import 'package:game_wiki_app/core/dio/i_dio_client.dart';
import 'package:game_wiki_app/core/dio/models/dio_model.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';

class DioClient implements IDioClient {
  final Dio client;

  DioClient(
    this.client,
  );

  @override
  Future<DioResponse> request({
    required String url,
    required DioMethod method,
    Map<String, dynamic>? params,
    dynamic body,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dynamic data;

    if (body is FormData) {
      data = body;
      method = DioMethod.POST;
    } else {
      data = body;
    }

    var response =
        Response(statusCode: 500, requestOptions: RequestOptions(path: ''));

    final defaultOptions = options ??
        Options(
          method: method.name,
        );
    try {
      switch (method) {
        case DioMethod.GET:
          response = await client.get(url,
              queryParameters: params,
              options: defaultOptions,
              cancelToken: cancelToken);
          break;
        case DioMethod.POST:
          response = await client.post(url,
              data: data, options: defaultOptions, cancelToken: cancelToken);
          break;
        case DioMethod.PUT:
          response = await client.put(url,
              data: data, options: defaultOptions, cancelToken: cancelToken);
          break;
        case DioMethod.DELETE:
          response = await client.delete(url,
              data: data, options: defaultOptions, cancelToken: cancelToken);
          break;
        default:
          throw Failure();
      }
    } catch (error) {
      if (error is DioException && error.response != null) {
        if (error.response!.data['message'].toString().replaceAll(".", "") ==
                'Token encontra-se expirado'.replaceAll(".", "") ||
            error.response!.data['message'].toString().replaceAll(".", "") ==
                'Token expirado'.replaceAll(".", "")) {
        } else {
          _handleResponse(error.response!);
        }
      } else {
        if (error == DioExceptionType.cancel) {
          throw CanceledError();
        } else {
          throw Failure();
        }
      }
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        {
          if (response.data is String || response.data is List) {
            Map<String, dynamic> newResponse = {'data': response.data};
            response.data = newResponse;
          }

          if (response.data is! Map && response.data?.stream != null) {
            response.data = null;
          }
          return DioResponse(
            statusCode: response.statusCode!,
            body: (response.data == null)
                ? null
                : Map<String, dynamic>.from(response.data),
            header: response.headers.isEmpty
                ? null
                : Map<String, dynamic>.from(response.headers.map),
          );
        }
      case 204:
        return DioResponse(
          statusCode: response.statusCode!,
          body: null,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 400:
        var error = response.data;
        ErrorModelCore errorModel = ErrorModelCore(
            status: error['status'],
            message: error['message'],
            code: error['code']);
        throw errorModel;
      case 401:
        var error = response.data;
        ErrorModelCore errorModel = ErrorModelCore(
            status: error['status'],
            message: error['message'],
            code: error['code']);
        throw errorModel;
      case 403:
        var error = response.data;
        ErrorModelCore errorModel = ErrorModelCore(
            status: error['status'],
            message: error['message'],
            code: error['code']);
        throw errorModel;
      case 404:
        var error = response.data;
        ErrorModelCore errorModel = ErrorModelCore(
            status: error['status'],
            message: error['message'],
            code: error['code']);
        throw errorModel;
      case 422:
        throw UnprocessableEntityError(
            data: (response.data == null || response.data.isEmpty)
                ? null
                : Map<String, dynamic>.from(response.data));
      case 500:
        throw Failure();
      default:
        throw ServerError();
    }
  }
}
