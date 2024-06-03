class MetaDatum {
  int? id;
  String? key;
  String? value;
  String? displayValue;
  String? displayKey;

  MetaDatum(
      {this.id, this.key, this.value, this.displayValue, this.displayKey});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json['id'] as int?,
        key: json['key'] as String?,
        value: json['value'] as String?,
        displayValue: json["display_value"]?.toString() ?? '',
        displayKey: json["display_key"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'value': value,
      };
}
