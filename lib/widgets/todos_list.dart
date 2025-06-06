import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../data/data.dart';
import '../providers/providers.dart';
import 'widgets.dart';

class TodosList extends ConsumerWidget {
  const TodosList({
    super.key,
    this.isCompletedTodos = false,
    required this.todos,
  });

  final bool isCompletedTodos;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTodos ? deviceSize.height * 0.24 : deviceSize.height * 0.28;
    final emptyTodosAlert =
        isCompletedTodos
            ? 'No To-Do completed yet'
            : 'No pending To-Do yet';

    return CommonContainer(
      height: height,
      child:
          todos.isEmpty
              ? Center(
                child: Text(
                  emptyTodosAlert,
                  style: context.textTheme.headlineSmall,
                ),
              )
              : ListView.separated(
                shrinkWrap: true,
                itemCount: todos.length,
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, index) {
                  final todo = todos[index];

                  return InkWell(
                    onLongPress: () async {
                      await AppAlerts.showAlertDeleteDialog(
                        context: context,
                        ref: ref,
                        todo: todo,
                      );
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TodoDetails(todo: todo);
                        },
                      );
                    },
                    child: TodoTile(
                      todo: todo,
                      onCompleted: (value) async {
                        await ref.read(todosProvider.notifier).updateTodo(todo);
                        if (!context.mounted) return;

                        AppAlerts.displaySnackbar(context, 
                           todo.isCompleted
                               ? 'To-Do is incomplete'
                               : 'To-Do completed',);
                      },
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => const Divider(thickness: 1.5),
              ),
    );
  }
}
