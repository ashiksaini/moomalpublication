import 'package:moomalpublication/features/quiz/data/models/answer_model.dart';

class QuestionsAndAnswer {
  final String? question;
  final List<Answer>? answers;

  QuestionsAndAnswer({
    this.question,
    this.answers,
  });

  factory QuestionsAndAnswer.fromJson(Map<String, dynamic> json) =>
      QuestionsAndAnswer(
        question: json["question"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(
                json["answers"]!.map((x) => Answer.fromJson(x))),
        // answers: (json["answers"] as List<dynamic>?)
        //     ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
        //     .toList(),
      );
}
