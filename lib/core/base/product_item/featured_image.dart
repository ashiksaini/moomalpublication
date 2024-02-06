class FeaturedImage {
  String? url;
  String? alt;

  FeaturedImage({this.url, this.alt});

  factory FeaturedImage.fromJson(Map<String, dynamic> json) {
    String val = "";
    if (json['url'] != null && json['url'] is String) {
      val = json['url'];
    }

    return FeaturedImage(
      url: val,
      alt: json['alt'] as String?,
    );
  }
}
