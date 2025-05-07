import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/utils/utils.dart';
import 'package:todo_list_app/widgets/widgets.dart';

import '../config/config.dart';
import '../data/data.dart';
import '../providers/providers.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);
    final todoState = ref.watch(todosProvider);
    final incompletedTodos = _incompletedTodo(todoState.todos, ref);
    final completedTodos = _completedTodo(todoState.todos, ref);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: deviceSize.height * 0.3,
                child: AppBackground(
                  headerHeight: deviceSize.height * 0.3,
                  header: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Helpers.selectDate(context, ref),
                          child: AppTextWhite(
                            text: Helpers.dateFormater(date),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const AppTextWhite(text: 'My To-Do List', fontSize: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TodosList(todos: incompletedTodos),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    TodosList(isCompletedTodos: true, todos: completedTodos),
                    const Gap(20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: colors.onPrimary,
                        padding: const EdgeInsets.all(8.0),
                      ),
                      onPressed: () => context.push(RouteLocation.addTodo),
                      child: const AppTextWhite(text: 'Add New To-Do'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Todo> _incompletedTodo(List<Todo> todos, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Todo> filteredTodo = [];

    for (var todo in todos) {
      if (!todo.isCompleted) {
        final isTodoDay = Helpers.isTodoFromSelectedDate(todo, date);
        if (isTodoDay) {
          filteredTodo.add(todo);
        }
      }
    }
    return filteredTodo;
  }

  List<Todo> _completedTodo(List<Todo> todos, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Todo> filteredTodo = [];

    for (var todo in todos) {
      if (todo.isCompleted) {
        final isTodoDay = Helpers.isTodoFromSelectedDate(todo, date);
        if (isTodoDay) {
          filteredTodo.add(todo);
        }
      }
    }
    return filteredTodo;
  }
}
