class ApiResponse<T> {
  final T? data;
  final bool success;
  final String message;

  ApiResponse({this.data, this.success = false, this.message = ''});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json['data'],
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'success': success,
      'message': message,
    };
  }
}
