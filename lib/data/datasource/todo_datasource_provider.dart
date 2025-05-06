import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data.dart';

final todoDatasourceProvider = Provider<TodoDatasource>((ref) {
  return TodoDatasource();
});
