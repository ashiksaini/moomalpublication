class Image {
  String? id;

  Image({this.id});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['@id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '@id': id,
      };
}
