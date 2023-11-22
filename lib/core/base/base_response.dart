class BaseReponse<T> {
  final int? statusCode;
  final String? message;
  final T? data;

  BaseReponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory BaseReponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonData,
  ) {
    return BaseReponse(
      statusCode: json['status_code'] as int?,
      message: json['message']?.toString(),
      data: json['data'] != null ? fromJsonData(json['data']) : null,
    );
  }
}
