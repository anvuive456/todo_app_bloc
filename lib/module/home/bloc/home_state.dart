part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class AddedTodoState extends HomeState{
  final TodoModel todo;
  AddedTodoState(this.todo);
}

class PageChangeState extends HomeState{
  final String appTitle;
  PageChangeState(this.appTitle);
}