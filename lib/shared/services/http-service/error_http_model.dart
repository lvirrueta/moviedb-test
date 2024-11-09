class ErrorHttp {
  ErrorHttp({
    required this.status,
    required this.message,
    required this.code,
  });

  final int status;
  final String message;
  final String code;
}
