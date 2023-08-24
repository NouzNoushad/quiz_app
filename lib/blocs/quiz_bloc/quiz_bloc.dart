import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/data/services/quiz_service.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizService quizService;

  int currentIndex = 0;
  int attempts = 0;
  int correctAttempts = 0;
  int wrongAttempts = 0;

  QuizBloc(this.quizService)
      : super(QuizOnGoingState(0, 0, 0, 0, 0, quizService.getQuestion(0),
            quizService.getOptions(0))) {
    on<QuizNextEvent>(nextQuestion);
    on<QuizFinishedEvent>(quizFinished);
  }

  FutureOr<void> nextQuestion(QuizNextEvent event, Emitter<QuizState> emit) {
    ++currentIndex;
    attempts = currentIndex + 1;
    if (event.selectedIndex != -1 &&
        quizService.isCorrect(currentIndex, event.selectedIndex)) {
      ++correctAttempts;
    }
    wrongAttempts = attempts - correctAttempts;
    double score = correctAttempts - wrongAttempts * 0.25;
    emit(QuizOnGoingState(
        score,
        currentIndex,
        attempts,
        correctAttempts,
        wrongAttempts,
        quizService.getQuestion(currentIndex),
        quizService.getOptions(currentIndex)));
  }

  FutureOr<void> quizFinished(
      QuizFinishedEvent event, Emitter<QuizState> emit) {
    ++currentIndex;
    attempts = currentIndex + 1;
    if (event.selectedIndex != -1 &&
        quizService.isCorrect(currentIndex, event.selectedIndex)) {
      ++correctAttempts;
    }
    wrongAttempts = attempts - correctAttempts;
    double score = correctAttempts - wrongAttempts * 0.25;
    emit(QuizFinishedState(
        score, currentIndex, attempts, correctAttempts, wrongAttempts));
  }
}
