class QuizResponseModel {
  final String? quizName;
  final DateTime? lastActivity;
  final String? quizViews;
  final String? quizTaken;

  QuizResponseModel({
    this.quizName,
    this.lastActivity,
    this.quizViews,
    this.quizTaken,
  });

  factory QuizResponseModel.fromJson(Map<String, dynamic> json) =>
      QuizResponseModel(
        quizName: json["quiz_name"] as String?,
        lastActivity: json["last_activity"] == null
            ? null
            : DateTime.tryParse(json["last_activity"] as String),
        quizViews: json["quiz_views"] as String?,
        quizTaken: json["quiz_taken"] as String?,
      );
}
