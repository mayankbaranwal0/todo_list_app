import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/utils.dart';

final selectedCategoryProvider = StateProvider.autoDispose<TodoCategory>((ref) {
  return TodoCategory.others;
});
