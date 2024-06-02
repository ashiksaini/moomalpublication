class Image {
  String? id;
  String? src;

  Image({this.id, this.src});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'].toString(),
        src: json['src'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'src': src,
      };
}
