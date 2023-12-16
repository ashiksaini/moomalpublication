class MetaDatum {
  String? key;
  String? value;

  MetaDatum({this.key, this.value});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        key: json['key'] as String?,
        value: json['value'] as String?,
      );
}
