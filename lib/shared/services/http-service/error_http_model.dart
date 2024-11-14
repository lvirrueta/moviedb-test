class ErrorHttp {
  ErrorHttp({
    required this.message,
    required this.code,
  });

  final String message;
  final String code; 

  factory ErrorHttp.fromJson(Map<String, dynamic> json) => ErrorHttp(
    code: json["status_code"]?.toString() ?? '',
    message: json["status_message"] ?? '',
  );
}
