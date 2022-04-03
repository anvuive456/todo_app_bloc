import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:todos_with_bloc/core/model/todo_model.dart';
import 'package:todos_with_bloc/core/repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoRepository repository;
  final pageController = PageController();

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {

    });
    on<AddTodoEvent>((event, emit) {
      repository.addTodo(todo: event.todo);
      emit(AddedTodoState(event.todo));
    },);

    on<PageChange>((event, emit) {
      if(event.page ==0){
        emit(PageChangeState('All Todos'));
      }if(event.page ==1){
        emit(PageChangeState('Uncompleted Todos'));
      }if(event.page ==2){
        emit(PageChangeState('Completed Todos'));
      }

    });
  }
}
