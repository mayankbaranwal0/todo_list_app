import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

final deleteTodoProvider = FutureProvider.autoDispose.family(
   (ref, Todo todo) async {
     final repository = ref.read(todoRepositoryProvider);
     return await repository.deleteTodo(todo);
   },
 );