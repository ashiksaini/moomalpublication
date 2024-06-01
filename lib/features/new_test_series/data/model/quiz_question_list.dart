class QuizQuestions {
  String question;
  List<String> options;
  List<int> selectedOption;

  QuizQuestions(
      {required this.options,
      required this.question,
      required this.selectedOption});
}
