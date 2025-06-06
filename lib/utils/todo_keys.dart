import 'package:flutter/material.dart';

@immutable
class TodoKeys {
  const TodoKeys._();
  static const String id = 'id';
  static const String title = 'title';
  static const String category = 'category';
  static const String date = 'date';
  static const String time = 'time';
  static const String note = 'note';
  static const String isCompleted = 'isCompleted';
}
