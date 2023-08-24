part of 'questions_bloc.dart';

sealed class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class QuizLoadedEvent extends QuestionsEvent {
  const QuizLoadedEvent();

  @override
  List<Object> get props => [];
}
