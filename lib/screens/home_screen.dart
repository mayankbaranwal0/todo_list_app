import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/utils/utils.dart';
import 'package:todo_list_app/widgets/widgets.dart';

import '../config/config.dart';
import '../providers/providers.dart';

 class HomeScreen extends ConsumerWidget {
   static HomeScreen builder(
     BuildContext context,
     GoRouterState state,
   ) =>
       const HomeScreen();
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
     final todos = ref.watch(todosProvider);
     final date = ref.watch(dateProvider);
     final completedTodos = ref.watch(completedTodosProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBackground(
                headerHeight: deviceSize.height * 0.3,
                header: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(60),
                    AppTextWhite(
                      text: DateFormat.yMMMd().format(date),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    const AppTextWhite(text: 'My To-Do List', fontSize: 40),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  todos.when(
                    data: (todos) {
                      return TodosList(todos: todos);
                    },
                    error: (error, _) => const ErrorMsgWidget(),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                  ),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  const TodosList(todos: [], isCompletedTodos: true),
                  completedTodos.when(
                    data: (completedTodos) {
                      return TodosList(
                        isCompletedTodos: true,
                        todos: completedTodos,
                      );
                    },
                    error: (error, _) => const ErrorMsgWidget(),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                  ),
                  const Gap(20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                      padding: const EdgeInsets.all(8.0),
                    ),
                    onPressed: () => context.push(RouteLocation.addTodo),
                    child: const AppTextWhite(text: 'Add To-Do'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
