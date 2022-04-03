import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_with_bloc/core/model/todo_model.dart';
import 'package:todos_with_bloc/core/repository/repository.dart';

part 'all_todo_event.dart';

part 'all_todo_state.dart';

class AllTodoBloc extends Bloc<AllTodoEvent, AllTodoState> {
  final TodoRepository repository;

  AllTodoBloc(this.repository) : super(AllTodoInitial()) {
    on<AllTodoEvent>((event, emit) {});
    on<InitEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          emit(LoadedState(repository.allTodos));
        },
      );
    });

    on<DeleteTodoEvent>(
      (event, emit) {
        repository.removeTodo(index: event.index);
        emit(LoadedState(repository.allTodos));
      },
    );

    on<ToggleTodoEvent>(
      (event, emit) {
        repository.toggle(index: event.index);
        emit(LoadedState(repository.allTodos));
      },
    );
    on<RefreshEvent>(_refreshData);
  }

  _refreshData(event, emit) {
    emit(LoadedState(repository.allTodos));
  }
}
