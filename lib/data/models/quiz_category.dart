class QuizCategory {
  final String title;
  final String category;

  QuizCategory({
    required this.title,
    required this.category,
  });
}

class QuestionModel {
  final String mode;
  final String category;

  QuestionModel({
    required this.mode,
    required this.category,
  });
}

class Question {
  final String question;
  final String answer;
  final List<String> options;

  Question({
    required this.question,
    required this.answer,
    required this.options,
  });
}
