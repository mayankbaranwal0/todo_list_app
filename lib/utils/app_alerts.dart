import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../data/data.dart';
import '../providers/providers.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: context.textTheme.bodyMedium),
        backgroundColor: context.colorScheme.onSecondary,
      ),
    );
  }

  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Todo todo,
  }) async {
    Widget cancelButton = TextButton(
      child: const Text('NO'),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        context.pop();
        await ref.read(todosProvider.notifier).deleteTodo(todo);

        if (!context.mounted) return;

        displaySnackbar(context, 'To-Do deleted successfully');
        context.pop();
      },
      child: const Text('YES'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this To-Do?'),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
