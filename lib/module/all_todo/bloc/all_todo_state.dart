part of 'all_todo_bloc.dart';

@immutable
abstract class AllTodoState {}

class AllTodoInitial extends AllTodoState {}

class LoadingState extends AllTodoState {}

class LoadedState extends AllTodoState {
  final List<TodoModel> todos;
  LoadedState(this.todos);
}

class ErrorState extends AllTodoState {}
