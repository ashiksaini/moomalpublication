class TestPostData {
  String? userId;
  String? testId;
  String? timeLeft;
  List<String>? anwers;

  TestPostData({
    this.userId,
    this.testId,
    this.timeLeft,
    this.anwers,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (userId != null) data.putIfAbsent('user_id', () => userId);
    if (testId != null) data.putIfAbsent('online_postid', () => testId);
    if (timeLeft != null) data.putIfAbsent('time_left', () => timeLeft);
    if (anwers != null) {
      data.putIfAbsent(
          'answers', () => anwers!.map((answer) => answer).toList());
    }

    return data;
  }
}
