class Value {
  String? ip;

  Value({this.ip});

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        ip: json['ip'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ip': ip,
      };
}
