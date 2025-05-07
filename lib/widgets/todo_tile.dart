import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../data/data.dart';
import 'widgets.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo, this.onCompleted});

  final Todo todo;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final colors = context.colorScheme;

    final textDecoration =
        todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = todo.isCompleted ? FontWeight.normal : FontWeight.bold;
    final double opacityValue = todo.isCompleted ? 0.1 : 0.7;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircularContainer(
            color: todo.category.color.withAlpha((opacityValue * 255).toInt()),
            child: Icon(
              todo.category.icon,
              color: colors.primary.withAlpha((opacityValue * 255).toInt()),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: style.titleMedium?.copyWith(
                    fontWeight: fontWeight,
                    fontSize: 20,
                    decoration: textDecoration,
                  ),
                ),
                Text(
                  todo.time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: todo.isCompleted,
            onChanged: onCompleted,
            checkColor: colors.surface,
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              return colors.primary;
            }),
          ),
        ],
      ),
    );
  }
}
