import 'target.dart';

class PotentialAction {
  String? type;
  Target? target;
  String? queryInput;

  PotentialAction({this.type, this.target, this.queryInput});

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return PotentialAction(
      type: json['@type'] as String?,
      target: json['target'] == null
          ? null
          : Target.fromJson(json['target'] as Map<String, dynamic>),
      queryInput: json['query-input'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '@type': type,
        'target': target?.toJson(),
        'query-input': queryInput,
      };
}
