
 import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

final addTodoProvider = FutureProviderFamily(
   (ref, Todo todo) async {
     final repository = ref.read(todoRepositoryProvider);
     return await repository.addTodo(todo);
   },
 );