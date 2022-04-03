part of 'completed_todo_bloc.dart';

@immutable
abstract class CompletedTodoState {}

class CompletedTodoInitial extends CompletedTodoState {}

class LoadingState extends CompletedTodoState {}

class LoadedState extends CompletedTodoState {
  final List<TodoModel> todos;

  LoadedState(this.todos);

}

class ErrorState extends CompletedTodoState {}
