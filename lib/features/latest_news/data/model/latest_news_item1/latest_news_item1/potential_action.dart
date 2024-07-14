class PotentialAction {
  String? type;
  String? name;
  List<String>? target;

  PotentialAction({this.type, this.name, this.target});

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return PotentialAction(
      type: json['@type'] as String?,
      name: json['name'] as String?,
      target: json['target'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
        '@type': type,
        'name': name,
        'target': target,
      };
}
