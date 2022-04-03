part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {

}

class AddTodoEvent extends HomeEvent{
  final TodoModel todo;
  AddTodoEvent(this.todo);
}

class PageChange extends HomeEvent {
  final int page;
  PageChange(this.page);
}