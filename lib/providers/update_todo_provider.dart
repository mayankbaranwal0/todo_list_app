import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

final updateTodoProvider = FutureProviderFamily((ref, Todo todo) async {
  final repository = ref.read(todoRepositoryProvider);
  return await repository.updateTodo(todo);
});
