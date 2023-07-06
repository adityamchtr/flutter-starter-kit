class ApiException implements Exception {
  final dynamic _message;

  ApiException([this._message]);

  @override
  String toString() {
    return _message;
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message]) : super(message ?? "Error During Communication");
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message ?? "Bad request");
}

class NotFoundException extends ApiException {
  NotFoundException([String? message]) : super(message ?? "Not Found");
}

class ForbiddenException extends ApiException {
  ForbiddenException([String? message]) : super(message ?? "Forbidden");
}

class InternalServerError extends ApiException {
  InternalServerError([String? message]) : super(message ?? "Internal Server Error");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message]) : super(message ?? "Unauthorised request");
}