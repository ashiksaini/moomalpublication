class BaseReponse<T> {
  final String? status;
  final String? message;
  final T? data;

  BaseReponse({
    this.status,
    this.message,
    this.data,
  });

  factory BaseReponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonData,
  ) {
    return BaseReponse(
      status: json['status'] as String?,
      message: json['message']?.toString(),
      data: json['data'] != null ? fromJsonData(json['data']) : null,
    );
  }
}
