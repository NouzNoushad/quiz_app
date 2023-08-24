import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/questions_bloc/questions_bloc.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/utils/colors.dart';

import '../data/models/quiz_category.dart';
import '../data/repositories/quiz_repository.dart';
import '../data/services/quiz_service.dart';

class QuizQuestions extends StatefulWidget {
  final QuestionModel question;
  const QuizQuestions({
    super.key,
    required this.question,
  });

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  late QuizService quizService;
  @override
  void initState() {
    quizService = QuizService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsBloc(
        quizRepository: QuizRepository(
          category: widget.question.category,
          mode: widget.question.mode,
        ),
      )..add(const QuizLoadedEvent()),
      child: Scaffold(
        backgroundColor: ColorPicker.colorScheme3,
        body: BlocConsumer<QuestionsBloc, QuestionsState>(
          listener: (context, state) {
            if (state is QuizLoadedState) {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteString.options,
                  arguments: state.response);
            }
          },
          builder: (context, state) {
            return BlocBuilder<QuestionsBloc, QuestionsState>(
              builder: (context, state) {
                return const Scaffold(
                  backgroundColor: ColorPicker.colorScheme3,
                  body: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: ColorPicker.colorScheme3,
                      color: ColorPicker.colorScheme4,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
    // return const Scaffold(
    //   backgroundColor: ColorPicker.colorScheme3,
    // );
  }
}
