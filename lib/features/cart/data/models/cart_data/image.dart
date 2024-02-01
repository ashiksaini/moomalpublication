class Image {
  int? id;
  String? src;
  String? thumbnail;
  String? srcset;
  String? sizes;
  String? name;
  String? alt;

  Image({
    this.id,
    this.src,
    this.thumbnail,
    this.srcset,
    this.sizes,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as int?,
        src: json['src'] as String?,
        thumbnail: json['thumbnail'] as String?,
        srcset: json['srcset'] as String?,
        sizes: json['sizes'] as String?,
        name: json['name'] as String?,
        alt: json['alt'] as String?,
      );
}
