import 'package:flutter/material.dart';

class TodoErrorWidget extends StatelessWidget {
  const TodoErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.error),
    );
  }
}
