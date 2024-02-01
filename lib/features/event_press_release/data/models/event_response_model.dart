class EventsResponseModel {
  final int? id;
  final String? postTitle;
  final String? postContent;
  final String? featuredImage;

  EventsResponseModel({
    this.id,
    this.postTitle,
    this.postContent,
    this.featuredImage,
  });
  factory EventsResponseModel.fromJson(Map<String, dynamic> json) {
    String val = "";
    if (json['featured_image'] != null && json['featured_image'] is String) {
      val = json['featured_image'];
    }

    return EventsResponseModel(
      id: json['ID'] as int?,
      postTitle: json['post_title'] as String?,
      postContent: json['post_content'] as String?,
      featuredImage: val,
    );
  }
}
