import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_app/utils/utils.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.category,
    required this.title,
    required this.time,
    required this.isCompleted,
    this.onCompleted,
  });

  final TodoCategory category;
  final String title;
  final String time;
  final bool isCompleted;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final colors = context.colorScheme;

    final textDecoration =
        isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = isCompleted ? FontWeight.normal : FontWeight.bold;
    final double opacityValue = isCompleted ? 0.1 : 0.3;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: category.color.withAlpha((opacityValue * 255).toInt()),
            ),
            child: Center(
              child: Icon(
                category.icon,
                color: category.color.withAlpha(((opacityValue + 0.5) * 255).toInt()),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style.titleMedium?.copyWith(
                    fontWeight: fontWeight,
                    fontSize: 20,
                    decoration: textDecoration,
                  ),
                ),
                Text(
                  time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            onChanged: onCompleted,
            checkColor: colors.surface,
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                return colors.primary;
            }),
          ),
        ],
      ),
    );
  }
}
