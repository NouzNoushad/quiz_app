import 'package:flutter/material.dart';
import 'package:quiz_app/data/models/quiz_category.dart';
import 'package:quiz_app/data/models/quiz_response.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/screens/quiz_categories.dart';
import 'package:quiz_app/screens/quiz_mode.dart';
import 'package:quiz_app/screens/quiz_options.dart';
import 'package:quiz_app/screens/quiz_questions.dart';
import 'package:quiz_app/screens/quiz_sign_in.dart';
import 'package:quiz_app/screens/quiz_sign_up.dart';

class QuizRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteString.signIn:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.signIn),
            builder: (context) => const QuizSignIn());
      case RouteString.signUp:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.signUp),
            builder: (context) => const QuizSignUp());
      case RouteString.categories:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.categories),
            builder: (context) => const QuizCategories());
      case RouteString.modes:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.modes),
            builder: (context) => QuizMode(
                  categoryIndex: settings.arguments as int,
                ));
      case RouteString.questions:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.questions),
            builder: (context) => QuizQuestions(question: settings.arguments as QuestionModel,));
      case RouteString.options:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.options),
            builder: (context) => QuizOptions(response: settings.arguments as List<QuizResponse>,));
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("Error Screen")),
                  body: const Center(child: Text("Theres Something Wrong")),
                ));
    }
  }
}
