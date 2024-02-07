import 'value.dart';

class MetaDatum {
  int? id;
  String? key;
  Value? value;

  MetaDatum({this.id, this.key, this.value});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json['id'] as int?,
        key: json['key'] as String?,
        value: json['value'] == null
            ? null
            : Value.fromJson(json['value'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'value': value?.toJson(),
      };
}
