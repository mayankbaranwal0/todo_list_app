import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class Todo extends Equatable {
  final int? id;
  final String title;
  final String note;
  final TodoCategory category;
  final String time;
  final String date;
  final bool isCompleted;

  const Todo({
    this.id,
    required this.title,
    required this.note,
    required this.category,
    required this.time,
    required this.date,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TodoKeys.id: id,
      TodoKeys.title: title,
      TodoKeys.note: note,
      TodoKeys.category: category.name,
      TodoKeys.time: time,
      TodoKeys.date: date,
      TodoKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map[TodoKeys.id],
      title: map[TodoKeys.title],
      note: map[TodoKeys.note],
      category: TodoCategory.stringToTodoCategory(map[TodoKeys.category]),
      time: map[TodoKeys.time],
      date: map[TodoKeys.date],
      isCompleted: map[TodoKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  List<Object> get props {
    return [title, note, category, time, date, isCompleted];
  }

  Todo copyWith({
    int? id,
    String? title,
    String? note,
    TodoCategory? category,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
