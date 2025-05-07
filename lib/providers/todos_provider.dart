import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import 'providers.dart';

final todosProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return TodoNotifier(repository);
});
