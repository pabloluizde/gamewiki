class Failure implements Exception {}

class BadRequestError extends Failure {}

class ServerError extends Failure {}

class UnauthorizedError extends Failure {}

class ForbiddenError extends Failure {}

class InvalidDataError extends Failure {}

class CanceledError extends Failure {}

class NotFoundError extends Failure {}

class UnprocessableEntityError extends Failure {
  final Map<String, dynamic>? data;

  UnprocessableEntityError({this.data});
}
