import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_with_bloc/core/model/todo_model.dart';
import 'package:todos_with_bloc/core/repository/repository.dart';

part 'uncompleted_todo_event.dart';
part 'uncompleted_todo_state.dart';

class UncompletedTodoBloc extends Bloc<UncompletedTodoEvent, UncompletedTodoState> {
  final TodoRepository repository;
  UncompletedTodoBloc(this.repository) : super(UncompletedTodoInitial()) {
    on<UncompletedTodoEvent>((event, emit) {

    });
    on<InitEvent>((event, emit) {
      emit(LoadingState());
      emit(LoadedState(repository.umCompletedTodos));

    },);

  }

}
