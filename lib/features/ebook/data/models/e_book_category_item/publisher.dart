class Publisher {
  String? id;

  Publisher({this.id});

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        id: json['@id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '@id': id,
      };
}
