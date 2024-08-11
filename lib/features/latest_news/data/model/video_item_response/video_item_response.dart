import 'featured_image.dart';

class VideoItemResponse {
  int? id;
  String? title;
  String? content;
  String? slug;
  FeaturedImage? featuredImage;

  VideoItemResponse({
    this.id,
    this.title,
    this.content,
    this.slug,
    this.featuredImage,
  });

  factory VideoItemResponse.fromJson(Map<String, dynamic> json) {
    return VideoItemResponse(
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'slug': slug,
        'featured_image': featuredImage?.toJson(),
      };
}
