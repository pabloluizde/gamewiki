// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:game_wiki_app/core/errors/errors_core.dart';

class ErrorModelCore extends Failure {
  String? status;
  String? message;
  String? code;
  ErrorModelCore({this.status, this.message, this.code});

  factory ErrorModelCore.empty() {
    return ErrorModelCore(
      status: '',
      message: '',
      code: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'code': code,
    };
  }

  factory ErrorModelCore.fromMap(Map<String, dynamic> map) {
    return ErrorModelCore(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModelCore.fromJson(String source) =>
      ErrorModelCore.fromMap(json.decode(source) as Map<String, dynamic>);
}
