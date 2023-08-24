part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  final double score;
  final int currentIndex;
  final int attempts;
  final int correctAttempts;
  final int wrongAttempts;
  const QuizState(this.score, this.currentIndex, this.attempts,
      this.correctAttempts, this.wrongAttempts);

  @override
  List<Object> get props => [currentIndex];
}

class QuizOnGoingState extends QuizState {
  final String currentQuestion;
  final List<String> options;
  const QuizOnGoingState(
      super.score,
      super.currentIndex,
      super.attempts,
      super.correctAttempts,
      super.wrongAttempts,
      this.currentQuestion,
      this.options);
  @override
  List<Object> get props => [currentQuestion];
}

class QuizFinishedState extends QuizState{
  const QuizFinishedState(super.score, super.currentIndex, super.attempts, super.correctAttempts, super.wrongAttempts);
}