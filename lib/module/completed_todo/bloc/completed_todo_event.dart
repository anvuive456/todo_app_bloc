part of 'completed_todo_bloc.dart';

@immutable
abstract class CompletedTodoEvent {}

class InitEvent extends CompletedTodoEvent{}



class DeleteTodoEvent extends CompletedTodoEvent {
  final int index;
  DeleteTodoEvent(this.index);
}

class ToggleTodoEvent extends CompletedTodoEvent{
  final int index;
  ToggleTodoEvent(this.index);
}