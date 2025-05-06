import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final datasource = ref.read(todoDatasourceProvider);
  return TodoRepositoryImpl(datasource);
});
