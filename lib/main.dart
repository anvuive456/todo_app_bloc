import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_with_bloc/core/base_bloc/base_bloc_observer.dart';
import 'package:todos_with_bloc/module/home/bloc/home_bloc.dart';
import 'package:todos_with_bloc/module/home/screen/home_screen.dart';
import 'package:todos_with_bloc/core/repository/repository.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: BaseBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: RepositoryProvider(
        create: (context) => TodoRepository(),
        lazy: false,
        child: BlocProvider(
          create: (context) => HomeBloc(context.read<TodoRepository>()),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
