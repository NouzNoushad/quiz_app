part of 'mode_bloc.dart';

sealed class ModeEvent extends Equatable {
  const ModeEvent();

  @override
  List<Object> get props => [];
}

class ModeInitialEvent extends ModeEvent {
  final int categoryIndex;
  const ModeInitialEvent(this.categoryIndex);

  @override
  List<Object> get props => [categoryIndex];
}

class ModeSelectedEvent extends ModeEvent {
  final String category;
  final String mode;
  const ModeSelectedEvent(this.category, this.mode);

  @override
  List<Object> get props => [category, mode];
}
