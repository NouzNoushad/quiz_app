import 'package:http/http.dart' as http;
import 'package:quiz_app/data/models/quiz_response.dart';
import 'package:quiz_app/utils/end_point.dart';

class QuizRepository {
  final String category;
  final String mode;
  QuizRepository({
    required this.category,
    required this.mode,
  });
  Future<List<QuizResponse>?> getQuizQuestions() async {
    Uri url = Uri.parse(EndPoints.quizQuestions(category, mode));
    List<QuizResponse>? quizResponse;
    Map<String, String> headers = {'Content-Type': 'application/json'};
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      quizResponse = quizResponseFromJson(response.body);
    } else {
      quizResponse = null;
    }
    print('//////////////// quiz response: $quizResponse');
    return quizResponse;
  }
}
