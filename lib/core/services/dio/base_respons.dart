class BaseRespons {
  dynamic data;
  String? message;
  List<dynamic>? error;
  int? status;

  BaseRespons({this.data, this.message, this.error, this.status});

  factory BaseRespons.fromJson(Map<String, dynamic> json) {
    return BaseRespons(
      data: json['data'],
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}
