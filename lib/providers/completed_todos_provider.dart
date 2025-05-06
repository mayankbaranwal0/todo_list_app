import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import '../utils/utils.dart';
import 'providers.dart';

final completedTodosProvider = FutureProvider.autoDispose((ref) async {
  final repository = ref.watch(todoRepositoryProvider);
  final date = ref.watch(dateProvider);
  final allTodos = await repository.getAllTodos();
  final List<Todo> filteredTodo = [];
  for (var todo in allTodos) {
    final isTodoDay = Helpers.isTodoFromSelectedDate(todo, date);
    if (isTodoDay) {
      filteredTodo.add(todo);
    }
  }

  return filteredTodo;
});
