abstract class AppException implements Exception {
  final String message;

  AppException({this.message = ''});
}

class UnexpectedException extends AppException {
  UnexpectedException({
    super.message = 'Um erro inesperado aconteceu!',
  });

  @override
  String toString() => message;
}

class RequestAccessException extends AppException {
  RequestAccessException({
    super.message = '',
  });

  @override
  String toString() => message;
}

class UnexpectedExceptionGeneric extends AppException {
  UnexpectedExceptionGeneric({
    required super.message,
  });

  @override
  String toString() => message;
}

class PaginationOutOfIndex extends AppException {
  PaginationOutOfIndex({super.message});
}

class ArgumentsException extends AppException {
  ArgumentsException({super.message});
}

class MissingNetworkConnection extends AppException {
  MissingNetworkConnection({
    super.message = 'Não há conexão com a internet!',
  });

  @override
  String toString() => message;
}

class NotAllowedException extends AppException {
  NotAllowedException({
    super.message = 'Você não tem permissão para acessar esta funcionalidade!',
  });

  @override
  String toString() => message;
}

class ForgotPasswordError extends AppException {
  ForgotPasswordError({required super.message});

  @override
  String toString() => message;
}


class MissingPriceException extends AppException {
  MissingPriceException({
    required super.message,
  });

  @override
  String toString() => message;
}
