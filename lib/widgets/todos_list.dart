import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../data/data.dart';
import 'widgets.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    super.key,
    this.isCompletedTodos = false,
    required this.todos,
  });

  final bool isCompletedTodos;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTodos ? deviceSize.height * 0.20 : deviceSize.height * 0.24;
    final emptyTodosAlert =
        isCompletedTodos
            ? 'There is no completed To-Do yet'
            : 'There is no To-Do yet';

    return CommonContainer(
      height: height,
      child:
          todos.isEmpty
              ? Center(child: AppTextWhite(text: emptyTodosAlert))
              : ListView.separated(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (ctx, index) {
                  final todo = todos[index];

                  return TodoTile(
                    category: TodoCategory.others,
                    title: todo.title,
                    time: todo.time,
                    isCompleted: todo.isCompleted,
                  );
                },
                separatorBuilder:
                    (context, index) => const Divider(thickness: 1.5),
              ),
    );
  }
}
