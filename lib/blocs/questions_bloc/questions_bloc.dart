import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/quiz_response.dart';
import '../../data/repositories/quiz_repository.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuizRepository quizRepository;
  QuestionsBloc({
    required this.quizRepository,
  }) : super(QuestionsInitial()) {
    on<QuizLoadedEvent>(quizLoaded);
  }

  FutureOr<void> quizLoaded(
      QuizLoadedEvent event, Emitter<QuestionsState> emit) async {
    emit(const QuizLoadingState());
    try {
      final response = await quizRepository.getQuizQuestions();
      if (response != null) {
        emit(QuizLoadedState(response));
      } else {
        emit(const QuizErrorState('Unable fetch questions'));
      }
    } catch (error) {
      emit(QuizErrorState(error.toString()));
    }
  }
}
