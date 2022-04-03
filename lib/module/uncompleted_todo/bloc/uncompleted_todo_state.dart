part of 'uncompleted_todo_bloc.dart';

@immutable
abstract class UncompletedTodoState {}

class UncompletedTodoInitial extends UncompletedTodoState {}

class LoadedState extends UncompletedTodoState{
  final List<TodoModel> todos;
  LoadedState(this.todos);
}

class LoadingState extends UncompletedTodoState{}

