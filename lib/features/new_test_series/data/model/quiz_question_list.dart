class QuizQuestions {
  String question;
  List<String> options;
  int? selectedOption;

  QuizQuestions(
      {required this.options, required this.question, this.selectedOption});
}
