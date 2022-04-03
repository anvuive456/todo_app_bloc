import 'package:todos_with_bloc/core/model/todo_model.dart';

class TodoRepository {

  List<TodoModel> fakeData=[
    TodoModel(title: 'title', date: 'date', id: '01'),
    TodoModel(title: 'title', date: 'date', id: '02'),
    TodoModel(title: 'title', date: 'date', id: '03'),
    TodoModel(title: 'title', date: 'date', id: '04'),
    TodoModel(title: 'title', date: 'date', id: '05'),
    TodoModel(title: 'title', date: 'date', id: '06'),
    TodoModel(title: 'title', date: 'date', id: '07'),
    TodoModel(title: 'title', date: 'date', id: '08'),
    TodoModel(title: 'title', date: 'date', id: '09'),
    TodoModel(title: 'title', date: 'date', id: '10'),
  ];


  List<TodoModel> get allTodos {
    return fakeData;
  }

  List<TodoModel> get umCompletedTodos {
    return fakeData
        .where((element) => element.isCompleted == false)
        .toList();
  }

  List<TodoModel> get completedTodos {
    return fakeData
        .where((element) => element.isCompleted == true)
        .toList();
  }


  void addTodo({required TodoModel todo}) {
    fakeData.add(todo);
  }

  void removeTodo({required int index}){
    fakeData.removeAt(index);
  }

  void toggle({required int index}) {
    fakeData[index].isCompleted = !fakeData[index].isCompleted;
  }


}
