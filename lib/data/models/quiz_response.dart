// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

import 'dart:convert';

List<QuizResponse> quizResponseFromJson(String str) => List<QuizResponse>.from(
    json.decode(str).map((x) => QuizResponse.fromJson(x)));

String quizResponseToJson(List<QuizResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizResponse {
  String? category;
  String? id;
  String? correctAnswer;
  List<String> incorrectAnswers;
  String? question;
  List<String> tags;
  String? type;
  String? difficulty;
  List<dynamic> regions;
  bool? isNiche;

  QuizResponse({
    this.category,
    this.id,
    this.correctAnswer,
    this.incorrectAnswers = const [],
    this.question,
    this.tags = const [],
    this.type,
    this.difficulty,
    this.regions = const [],
    this.isNiche,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        category: json["category"],
        id: json["id"],
        correctAnswer: json["correctAnswer"],
        incorrectAnswers:
            List<String>.from(json["incorrectAnswers"].map((x) => x)),
        question: json["question"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        type: json["type"],
        difficulty: json["difficulty"],
        regions: List<dynamic>.from(json["regions"].map((x) => x)),
        isNiche: json["isNiche"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "id": id,
        "correctAnswer": correctAnswer,
        "incorrectAnswers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
        "question": question,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "type": type,
        "difficulty": difficulty,
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "isNiche": isNiche,
      };
}

