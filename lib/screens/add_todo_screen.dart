import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../config/config.dart';
import '../data/data.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  static AddTodoScreen builder(BuildContext context, GoRouterState state) =>
      const AddTodoScreen();
  const AddTodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const AppTextWhite(text: 'Add New To-Do'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: 'To-Do Title',
                title: 'To-Do Title',
                controller: _titleController,
              ),
              const Gap(30),
              const CategorySelectionWidget(),
              const Gap(30),
              const DateTimeSelectionWidget(),
              const Gap(30),
              CommonTextField(
                hintText: 'Notes',
                title: 'Notes',
                maxLines: 6,
                controller: _noteController,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  padding: const EdgeInsets.all(8.0),
                ),
                onPressed: _createTodo,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppTextWhite(text: 'Save'),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  void _createTodo() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final todo = Todo(
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: Helpers.dateFormater(date),
        note: note,
        isCompleted: false,
      );

      await ref.read(todosProvider.notifier).createTodo(todo);
      if (!mounted) return;

      AppAlerts.displaySnackbar(context, 'To-Do added successfully');
      context.go(RouteLocation.home);
    } else {
      AppAlerts.displaySnackbar(context, 'Title cannot be empty');
    }
  }
}
