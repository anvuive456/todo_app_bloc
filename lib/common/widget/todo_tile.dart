import 'package:flutter/material.dart';
import 'package:todos_with_bloc/core/model/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
 final VoidCallback onTap;
 final VoidCallback onLongPressed;
  const TodoTile({Key? key, required this.todo, required this.onTap, required this.onLongPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPressed,
      title: Text(this.todo.title),
      subtitle: Text(this.todo.date),
      trailing: Text(this.todo.isCompleted
          ? 'Completed'
          : 'Uncompleted'),
    );
  }
}
