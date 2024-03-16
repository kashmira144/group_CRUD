class ErrorResponse {
  int? statusCode;
  bool? error;
  String? message;

  ErrorResponse({this.statusCode, this.error, this.message});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['error'] = error;
    data['message'] = message;
    return data;
  }

  @override
  String toString() {
    return 'ErrorResponse{statusCode: $statusCode, error: $error, message: $message}';
  }
}
