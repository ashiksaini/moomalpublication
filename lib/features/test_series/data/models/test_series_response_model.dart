class TestSeriesResponseModel {
  final int? id;
  final String? postTitle;
  final String? postContent;

  TestSeriesResponseModel({
    this.id,
    this.postTitle,
    this.postContent,
  });

  factory TestSeriesResponseModel.fromJson(Map<String, dynamic> json) {
    return TestSeriesResponseModel(
      id: json['ID'] as int?,
      postTitle: json['post_title'] as String?,
      postContent: json['post_content'] as String?,
    );
  }
}
