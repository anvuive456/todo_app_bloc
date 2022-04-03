import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_with_bloc/common/widget/todo_tile.dart';
import 'package:todos_with_bloc/module/uncompleted_todo/bloc/uncompleted_todo_bloc.dart';

class UncompletedTodoScreen extends StatelessWidget {
  const UncompletedTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UncompletedTodoBloc>().add(InitEvent());
    return Scaffold(
      body: BlocBuilder<UncompletedTodoBloc, UncompletedTodoState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (BuildContext context, int index) => TodoTile(
                  todo: state.todos[index],
                  onTap: () =>
                      context.read<UncompletedTodoBloc>().add(ToggleTodoEvent(index)),
                  onLongPressed: () =>
                      context.read<UncompletedTodoBloc>().add(DeleteTodoEvent(index))),
            );
          } else {
            return const Center(
              child: Icon(Icons.error),
            );
          }
        },
      ),
    );
  }
}
