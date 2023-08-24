part of 'mode_bloc.dart';

sealed class ModeState extends Equatable {
  const ModeState();

  @override
  List<Object> get props => [];
}

final class ModeInitial extends ModeState {}

class CategoryLoadedState extends ModeState {
  final int categoryIndex;
  const CategoryLoadedState(this.categoryIndex);

  @override
  List<Object> get props => [categoryIndex];
}

class ModeSelectedState extends ModeState {
  final String category;
  final String mode;
  const ModeSelectedState(this.category, this.mode);

  @override
  List<Object> get props => [category, mode];
}

class ModeErrorState extends ModeState {
  final String error;
  const ModeErrorState(this.error);

  @override
  List<Object> get props => [error];
}
