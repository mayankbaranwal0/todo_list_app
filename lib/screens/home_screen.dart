import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/utils/utils.dart';
import 'package:todo_list_app/widgets/widgets.dart';

import '../config/config.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBackground(
                headerHeight: deviceSize.height * 0.3,
                header: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(60),
                    AppTextWhite(
                      text: '6 May, 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    AppTextWhite(text: 'My To-Do List', fontSize: 40),
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
                  const TodosList(todos: []),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  const TodosList(todos: [], isCompletedTodos: true),
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
