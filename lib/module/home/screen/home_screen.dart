import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_with_bloc/core/model/todo_model.dart';
import 'package:todos_with_bloc/module/all_todo/bloc/all_todo_bloc.dart';
import 'package:todos_with_bloc/module/all_todo/screen/all_todo_screen.dart';
import 'package:todos_with_bloc/module/completed_todo/bloc/completed_todo_bloc.dart';
import 'package:todos_with_bloc/module/completed_todo/screen/completed_todo_screen.dart';
import 'package:todos_with_bloc/module/home/bloc/home_bloc.dart';
import 'package:todos_with_bloc/module/uncompleted_todo/bloc/uncompleted_todo_bloc.dart';
import 'package:todos_with_bloc/module/uncompleted_todo/screen/uncompleted_todo_screen.dart';
import 'package:todos_with_bloc/core/repository/repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(PageChange(0));
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<HomeBloc>().add(AddTodoEvent(
                  TodoModel(title: 'new todo', id: 'nope', date: 'new date')));
            },
          ),
          appBar: AppBar(
            title: Text(state is PageChangeState ? state.appTitle : 'Loading'),
          ),
          body: PageView(
            controller: BlocProvider.of<HomeBloc>(context).pageController,
            onPageChanged: (page) {
              context.read<HomeBloc>().add(PageChange(page));
            },
            children: [
              BlocProvider(
                create: (context) =>
                    AllTodoBloc(RepositoryProvider.of<TodoRepository>(context)),
                child: const AllTodoScreen(),
              ),
              BlocProvider(
                create: (context) => UncompletedTodoBloc(
                    RepositoryProvider.of<TodoRepository>(context)),
                child: const UncompletedTodoScreen(),
              ),
              BlocProvider(
                create: (context) => CompletedTodoBloc(
                    RepositoryProvider.of<TodoRepository>(context)),
                child: const CompletedTodoScreen(),
              )
            ],
          ),
        );
      },
    );
  }
}
