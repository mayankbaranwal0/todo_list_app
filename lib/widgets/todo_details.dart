import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../data/data.dart';
import 'widgets.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularContainer(
            color: todo.category.color.withAlpha((0.3 * 255).toInt()),
            child: Icon(todo.category.icon, color: todo.category.color),
          ),
          const Gap(16),
          Column(
            children: [
              Text(
                todo.title,
                style: style.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(todo.time, style: style.titleMedium),
            ],
          ),
          const Gap(16),
          Text(
            todo.note.isEmpty
                ? 'There is no additional note for this To-Do'
                : todo.note,
            style: context.textTheme.titleMedium,
          ),
          const Gap(16),
          Visibility(
            visible: todo.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('To-Do Completed'),
                Icon(Icons.check_box, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
