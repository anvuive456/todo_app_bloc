import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_with_bloc/common/widget/error_widget.dart';
import 'package:todos_with_bloc/common/widget/todo_tile.dart';
import 'package:todos_with_bloc/module/completed_todo/bloc/completed_todo_bloc.dart';

class CompletedTodoScreen extends StatelessWidget {
  const CompletedTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CompletedTodoBloc>().add(InitEvent());
    return Scaffold(
      body: BlocBuilder<CompletedTodoBloc, CompletedTodoState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => TodoTile(
                  todo: state.todos[index],
                  onTap: () => context.read<CompletedTodoBloc>(),
                  onLongPressed: ()=> context.read<CompletedTodoBloc>()),
            );
          } else {
            return const TodoErrorWidget();
          }
        },
      ),
    );
  }
}
