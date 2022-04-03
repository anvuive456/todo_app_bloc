part of 'all_todo_bloc.dart';

@immutable
abstract class AllTodoEvent {

}

class InitEvent extends AllTodoEvent {}



class DeleteTodoEvent extends AllTodoEvent {
  final int index;
  DeleteTodoEvent(this.index);
}

class ToggleTodoEvent extends AllTodoEvent{
  final int index;
  ToggleTodoEvent(this.index);
}

class RefreshEvent extends AllTodoEvent{

}
