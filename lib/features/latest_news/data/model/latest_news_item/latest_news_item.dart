import 'featured_image.dart';

class LatestNewsItem {
  int? id;
  String? title;
  String? content;
  String? slug;
  FeaturedImage? featuredImage;

  LatestNewsItem({
    this.id,
    this.title,
    this.content,
    this.slug,
    this.featuredImage,
  });

  factory LatestNewsItem.fromJson(Map<String, dynamic> json) {
    return LatestNewsItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      slug: json['slug'] as String?,
      featuredImage: json['featured_image'] == null
          ? null
          : FeaturedImage.fromJson(
              json['featured_image'] as Map<String, dynamic>),
    );
  }
}
