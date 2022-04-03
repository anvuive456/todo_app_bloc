part of 'uncompleted_todo_bloc.dart';

@immutable
abstract class UncompletedTodoEvent {}

class InitEvent extends UncompletedTodoEvent {}


class DeleteTodoEvent extends UncompletedTodoEvent {
  final int index;
  DeleteTodoEvent(this.index);
}

class ToggleTodoEvent extends UncompletedTodoEvent{
  final int index;
  ToggleTodoEvent(this.index);
}