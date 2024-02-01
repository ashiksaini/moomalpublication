class Answer {
  final String? answer;
  final bool? correctOrNot;

  Answer({
    this.answer,
    this.correctOrNot,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json["answer"] as String?,
        correctOrNot: json["correct_or_not"] as bool?,
      );
}
