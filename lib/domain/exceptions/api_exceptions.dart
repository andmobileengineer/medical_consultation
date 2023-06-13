class AppException implements Exception {
  final String message;
  final int code;
  const AppException(this.message, {this.code = 404});
}

class UnauthorizedException extends AppException implements Exception {
  UnauthorizedException(String message, {int code = 404})
      : super(message, code: code);
  @override
  String toString() {
    return message;
  }
}

class UnknownException extends AppException implements Exception {
  const UnknownException(String message, {int code = 404})
      : super(message, code: code);
  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends AppException implements Exception {
  const FetchDataException(String message, {int code = 404})
      : super(message, code: code);
  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends AppException implements Exception {
  const BadRequestException(String message, {int code = 404})
      : super(message, code: code);
  @override
  String toString() {
    return message;
  }
}

class InvalidOTPException extends AppException implements Exception {
  const InvalidOTPException(String message, {int code = 404})
      : super(message, code: code);
  @override
  String toString() {
    return message;
  }
}
