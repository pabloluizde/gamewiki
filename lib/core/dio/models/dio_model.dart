class DioResponse {
  final int statusCode;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? header;

  DioResponse({required this.statusCode, this.body, this.header});
}
