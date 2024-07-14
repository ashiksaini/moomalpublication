class Attribute {
  String? name;
  String? slug;
  String? option;

  Attribute({this.name, this.slug, this.option});

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        option: json['option'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'slug': slug,
        'option': option,
      };
}
