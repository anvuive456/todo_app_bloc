import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_with_bloc/core/model/todo_model.dart';
import 'package:todos_with_bloc/core/repository/repository.dart';

part 'completed_todo_event.dart';

part 'completed_todo_state.dart';

class CompletedTodoBloc extends Bloc<CompletedTodoEvent, CompletedTodoState> {
  final TodoRepository repository;
  CompletedTodoBloc(this.repository) : super(CompletedTodoInitial()) {
    on<CompletedTodoEvent>((event, emit) {});
    on<InitEvent>((event, emit) {
      emit(LoadingState());
      emit(LoadedState(repository.completedTodos));
    });
  }


}
