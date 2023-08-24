import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mode_event.dart';
part 'mode_state.dart';

class ModeBloc extends Bloc<ModeEvent, ModeState> {
  ModeBloc() : super(ModeInitial()) {
    on<ModeInitialEvent>(initiateCategory);
    on<ModeSelectedEvent>(selectMode);
  }

  FutureOr<void> initiateCategory(
      ModeInitialEvent event, Emitter<ModeState> emit) {
    try {
      emit(CategoryLoadedState(event.categoryIndex));
    } catch (error) {
      emit(ModeErrorState(error.toString()));
    }
  }

  FutureOr<void> selectMode(ModeSelectedEvent event, Emitter<ModeState> emit) {
    try {
      emit(ModeSelectedState(event.category, event.mode));
    } catch (error) {
      emit(ModeErrorState(error.toString()));
    }
  }
}
