import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_with_bloc/common/widget/error_widget.dart';
import 'package:todos_with_bloc/common/widget/todo_tile.dart';
import 'package:todos_with_bloc/module/all_todo/bloc/all_todo_bloc.dart';
import 'package:todos_with_bloc/module/home/bloc/home_bloc.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllTodoBloc>(context).add(InitEvent());
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AddedTodoState)
            context.read<AllTodoBloc>().add(RefreshEvent());
        },
        child: BlocBuilder<AllTodoBloc, AllTodoState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is LoadedState) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (BuildContext context, int index) => TodoTile(
                    todo: state.todos[index],
                    onTap: () =>
                        context.read<AllTodoBloc>().add(ToggleTodoEvent(index)),
                    onLongPressed: () => context
                        .read<AllTodoBloc>()
                        .add(DeleteTodoEvent(index))),
              );
            } else {
              return const TodoErrorWidget();
            }
          },
        ),
      ),
    );
  }
}
