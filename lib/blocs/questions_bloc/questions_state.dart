part of 'questions_bloc.dart';

sealed class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

final class QuestionsInitial extends QuestionsState {}

class QuizLoadingState extends QuestionsState {
  const QuizLoadingState();

  @override
  List<Object> get props => [];
}

class QuizLoadedState extends QuestionsState {
  final List<QuizResponse> response;
  const QuizLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class QuizErrorState extends QuestionsState {
  final String error;
  const QuizErrorState(this.error);

  @override
  List<Object> get props => [error];
}
