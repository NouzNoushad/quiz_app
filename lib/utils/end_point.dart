class EndPoints {
  static String baseUrl = 'https://the-trivia-api.com/api';
  static String quizQuestions(String category, String mode) {
    return '$baseUrl/questions?categories=$category&limit=10&difficulty=$mode';
  }
}
