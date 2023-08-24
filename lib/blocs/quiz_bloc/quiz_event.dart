part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class QuizNextEvent extends QuizEvent {
  final int selectedIndex;
  const QuizNextEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class QuizFinishedEvent extends QuizEvent {
  final int selectedIndex;
  const QuizFinishedEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
