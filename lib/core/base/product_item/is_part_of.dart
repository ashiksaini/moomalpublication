class IsPartOf {
  String? id;

  IsPartOf({this.id});

  factory IsPartOf.fromJson(Map<String, dynamic> json) => IsPartOf(
        id: json['@id'] as String?,
      );

  Map<String, dynamic> toFrom() => {
        '@id': id,
      };
}
