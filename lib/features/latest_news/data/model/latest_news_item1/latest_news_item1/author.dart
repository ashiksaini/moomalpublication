class Author {
  String? name;
  String? id;

  Author({this.name, this.id});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json['name'] as String?,
        id: json['@id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        '@id': id,
      };
}
