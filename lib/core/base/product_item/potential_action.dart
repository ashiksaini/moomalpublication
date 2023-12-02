class PotentialAction {
  String? type;
  List<String>? target;

  PotentialAction({this.type, this.target});

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return PotentialAction(
      type: json['@type'] as String?,
      target: json['target'] as List<String>?,
    );
  }

  Map<String, dynamic> toFrom() => {
        '@type': type,
        'target': target,
      };
}
