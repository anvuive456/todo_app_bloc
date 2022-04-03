import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  String id;
  String title;
  String date;
  bool isCompleted;

  TodoModel(
      {required this.title,
      required this.date,
      required this.id,
      this.isCompleted = false});

  TodoModel copyWith(
      {String? title, String? date, String? id, bool? isCompleted}) {
    return TodoModel(
        title: title ?? this.title,
        date: date ?? this.date,
        id: id ?? this.id,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.date, this.title, this.isCompleted];
}
