import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../providers/providers.dart';
import 'widgets.dart';

class CategorySelectionWidget extends ConsumerWidget {
  const CategorySelectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final List<TodoCategory> categories = TodoCategory.values.toList();

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge),
          const Gap(10),
          ListView.separated(
            itemCount: categories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              final category = categories[index];

              return InkWell(
                onTap: () {
                  ref.read(categoryProvider.notifier).state = category;
                },
                borderRadius: BorderRadius.circular(30),
                child: CircularContainer(
                  color: category.color.withAlpha((0.3 * 255).toInt()),
                  child: Icon(
                    category.icon,
                    color:
                        selectedCategory == category
                            ? context.colorScheme.primary
                            : category.color.withAlpha((0.5 * 255).toInt()),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Gap(8),
          ),
        ],
      ),
    );
  }
}
