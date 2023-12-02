class OgImage {
  int? width;
  int? height;
  String? url;
  String? type;

  OgImage({this.width, this.height, this.url, this.type});

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json['width'] as int?,
        height: json['height'] as int?,
        url: json['url'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toFrom() => {
        'width': width,
        'height': height,
        'url': url,
        'type': type,
      };
}
