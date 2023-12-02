class Logo {
  String? type;
  String? inLanguage;
  String? id;
  String? url;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;

  Logo({
    this.type,
    this.inLanguage,
    this.id,
    this.url,
    this.contentUrl,
    this.width,
    this.height,
    this.caption,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        type: json['@type'] as String?,
        inLanguage: json['inLanguage'] as String?,
        id: json['@id'] as String?,
        url: json['url'] as String?,
        contentUrl: json['contentUrl'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        caption: json['caption'] as String?,
      );

  Map<String, dynamic> toFrom() => {
        '@type': type,
        'inLanguage': inLanguage,
        '@id': id,
        'url': url,
        'contentUrl': contentUrl,
        'width': width,
        'height': height,
        'caption': caption,
      };
}
