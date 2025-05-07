import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

final updateTodoProvider = FutureProvider.autoDispose.family((ref, Todo todo) async {
  final repository = ref.read(todoRepositoryProvider);
  final isCompleted = !todo.isCompleted;
  final updatedTodo = todo.copyWith(isCompleted: isCompleted);

  return await repository.updateTodo(updatedTodo);
});
