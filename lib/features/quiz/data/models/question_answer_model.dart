import 'package:moomalpublication/features/quiz/data/models/answer_model.dart';

class QuestionsAndAnswer {
  final String? question;
  final List<Answer>? answers;
  int selectedOption;

  QuestionsAndAnswer({
    this.question,
    this.answers,
    this.selectedOption = -1,
  });

  factory QuestionsAndAnswer.fromJson(Map<String, dynamic> json) =>
      QuestionsAndAnswer(
        question: json["question"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(
                json["answers"]!.map((x) => Answer.fromJson(x))),
      );
}
