import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import 'providers.dart';

final todosProvider = FutureProvider(
   (ref) async {
     final repository = ref.watch(todoRepositoryProvider);
     final date = ref.watch(dateProvider);
 
     return await repository.getAllTodos();
   },
 );