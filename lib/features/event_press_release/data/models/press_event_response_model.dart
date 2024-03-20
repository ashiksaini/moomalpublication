class PressEventResponseModel {
  int? id;
  String? postTitle;
  String? postContent;
  String? featuredImage;

  PressEventResponseModel({
    this.id,
    this.postTitle,
    this.postContent,
    this.featuredImage,
  });

  factory PressEventResponseModel.fromJson(Map<String, dynamic> json) {
    return PressEventResponseModel(
      id: json['ID'] as int?,
      postTitle: json['post_title'] as String?,
      postContent: json['post_content'] as String?,
      featuredImage: json['featured_image'] as String?,
    );
  }
}
