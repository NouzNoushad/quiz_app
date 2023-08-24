import 'package:quiz_app/data/models/quiz_category.dart';

import '../models/quiz_response.dart';

class QuizService {
  List<Question> questionList = [];

  arrangeQuiz(List<QuizResponse> quizResponse) {
    for (int i = 0; i < 10; i++) {
      QuizResponse quiz = quizResponse[i];
      List<String> quizOptions = quiz.incorrectAnswers;
      quizOptions.add(quiz.correctAnswer.toString());
      quizOptions.shuffle();
      questionList.add(Question(
          question: quiz.question.toString(),
          answer: quiz.correctAnswer.toString(),
          options: quizOptions));
    }
    print('//////// question list: $questionList');
  }

  String getQuestion(int index) {
    return questionList[index].question;
  }

  List<String> getOptions(int index) {
    return questionList[index].options;
  }

  bool isCorrect(int index, int selectedOption) {
    if (questionList[index].options[selectedOption] ==
        questionList[index].answer) return true;
    return false;
  }
}
