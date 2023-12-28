class BaseResponse<T> {
  final String? status;
  final String? code;
  final String? message;
  final T? data;

  BaseResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonData,
  ) {
    return BaseResponse(
      status: json['status'] as String?,
      message: json['message']?.toString(),
      code: json['code']?.toString(),
      data: json['data'] != null ? fromJsonData(json['data']) : null,
    );
  }
}
