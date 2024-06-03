class TestResultResponseData {
  String? testSeries;
  String? score;
  String? rank;
  int? total;
  int? correct;
  int? incorrect;
  int? skipped;
  String? action;

  TestResultResponseData({
    this.testSeries,
    this.score,
    this.rank,
    this.total,
    this.correct,
    this.incorrect,
    this.skipped,
    this.action,
  });

  factory TestResultResponseData.fromJson(Map<String, dynamic> json) {
    return TestResultResponseData(
      testSeries: json['test_series'] as String?,
      score: json['score'] as String?,
      rank: json['rank'] as String?,
      total: json['total'] as int?,
      correct: json['correct'] as int?,
      incorrect: json['incorrect'] as int?,
      skipped: json['skipped'] as int?,
      action: json['action'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'test_series': testSeries,
        'score': score,
        'rank': rank,
        'total': total,
        'correct': correct,
        'incorrect': incorrect,
        'skipped': skipped,
        'action': action,
      };
}
