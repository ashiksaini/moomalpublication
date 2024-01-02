class TestSeriesResponseModel {
  final int? id;
  final String? postTitle;
  final String? postContent;
  final String? maximumTime;
  final String? totalMarks;
  final dynamic questionCount;
  final String? permalink;
  final String? price;
  final String? freePaid;

  TestSeriesResponseModel({
    this.id,
    this.postTitle,
    this.postContent,
    this.maximumTime,
    this.totalMarks,
    this.questionCount,
    this.permalink,
    this.price,
    this.freePaid,
  });

  factory TestSeriesResponseModel.fromJson(Map<String, dynamic> json) =>
      TestSeriesResponseModel(
        id: json['ID'] as int?,
        postTitle: json['post_title'] as String?,
        postContent: json['post_content'] as String?,
        maximumTime: json["maximum_time"] as String?,
        totalMarks: json["total_marks"] as String?,
        questionCount: json["question_count"],
        permalink: json["permalink"] as String?,
        price: json["price"] as String?,
        freePaid: json["free_paid"] as String?,
      );
}
