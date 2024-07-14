class CategoryItemR {
  int? id;
  String? name;
  String? slug;

  CategoryItemR({this.id, this.name, this.slug});

  factory CategoryItemR.fromJson(Map<String, dynamic> json) => CategoryItemR(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
      };
}
