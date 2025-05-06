import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/utils/utils.dart';
import 'package:intl/intl.dart';

import '../data/data.dart';
import '../providers/providers.dart';

@immutable
class Helpers {
  const Helpers._();
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      final formatType = DateFormat.jm();
      return formatType.format(date);
    } catch (e) {
      return '12:00';
    }
  }

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: context.textTheme.bodyMedium),
        backgroundColor: context.colorScheme.onSecondary,
      ),
    );
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static bool isTodoFromSelectedDate(Todo todo, DateTime selectedDate) {
    final DateTime todoDate = _stringToDateTime(todo.date);
    if (todoDate.month == selectedDate.month &&
        todoDate.year == selectedDate.year &&
        todoDate.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  static DateTime _stringToDateTime(String dateString) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }
}
