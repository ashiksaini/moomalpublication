class FeaturedImage {
  String? url;
  String? alt;

  FeaturedImage({this.url, this.alt});

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        url: json['url'] as String?,
        alt: json['alt'] as String?,
      );
}
