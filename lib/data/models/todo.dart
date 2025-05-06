import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class Todo extends Equatable {
  final int id;
  final String title;
  final TodoCategory category;
  final String time;
  final DateTime date;
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.date,
    required this.isCompleted,
  });

  @override
  List<Object> get props {
    return [id, title, category, time, date, isCompleted];
  }
}
