import 'package:moomalpublication/features/quiz/data/models/question_answer_model.dart';

class TestQuestionsResponseModel {
  final String? id;
  final String? postTitle;
  final String? postContent;
  final List<QuestionsAndAnswer>? questionsAndAnswers;

  TestQuestionsResponseModel({
    this.id,
    this.postTitle,
    this.postContent,
    this.questionsAndAnswers,
  });

  factory TestQuestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      TestQuestionsResponseModel(
        id: json["ID"],
        postTitle: json["post_title"],
        postContent: json["post_content"],
        questionsAndAnswers: json["questions_and_answers"] == null
            ? []
            : List<QuestionsAndAnswer>.from(json["questions_and_answers"]!
                .map((x) => QuestionsAndAnswer.fromJson(x))),
        // questionsAndAnswers: (json["questions_and_answers"] as List<dynamic>?)
        //     ?.map((e) => QuestionsAndAnswer.fromJson(e as Map<String, dynamic>))
        //     .toList(),
      );
}
