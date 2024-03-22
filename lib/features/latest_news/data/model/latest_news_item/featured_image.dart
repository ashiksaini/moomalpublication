class FeaturedImage {
  String? thumbnail;
  String? medium;
  String? large;

  FeaturedImage({this.thumbnail, this.medium, this.large});

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        thumbnail: json['thumbnail'] as String?,
        medium: json['medium'] as String?,
        large: json['large'] as String?,
      );
}
