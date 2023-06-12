class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error saat komunikasi: ');
}

class BadrequestException extends AppException {
  BadrequestException([String? message]) : super(message, 'Data tidak valid: ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized: ');
}

class UnprocessableEntityException extends AppException {
  UnprocessableEntityException([String? message]) : super(message, 'Data tidak dapat diproses: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Input tidak valid: ');
}
