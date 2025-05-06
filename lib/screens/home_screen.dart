import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_app/utils/utils.dart';
import 'package:todo_list_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
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
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWhite(
                      text: '6 May, 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    // const Gap(12),
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
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TodosList(todos: []),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    const TodosList(todos: [], isCompletedTodos: true),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const AppTextWhite(text: 'Add To-Do'),
                      ),
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
}
