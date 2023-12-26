class Target {
  String? type;
  String? urlTemplate;

  Target({this.type, this.urlTemplate});

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        type: json['@type'] as String?,
        urlTemplate: json['urlTemplate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '@type': type,
        'urlTemplate': urlTemplate,
      };
}
