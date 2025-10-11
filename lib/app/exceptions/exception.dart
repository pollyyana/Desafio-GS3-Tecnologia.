class AppException implements Exception {
  final String message;
  final int? code; // opcional, pra códigos de erro, se quiser

  AppException(this.message, {this.code});

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}
