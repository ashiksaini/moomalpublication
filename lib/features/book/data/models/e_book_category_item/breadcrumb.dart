class Breadcrumb {
  String? id;

  Breadcrumb({this.id});

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json['@id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '@id': id,
      };
}
