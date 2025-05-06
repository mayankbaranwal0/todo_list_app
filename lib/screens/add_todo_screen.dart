import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/utils/utils.dart';

import '../widgets/widgets.dart';

class AddTodoScreen extends StatelessWidget {
  static AddTodoScreen builder(BuildContext context, GoRouterState state) =>
      const AddTodoScreen();
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const AppTextWhite(text: 'Add New To-Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(
              hintText: 'To-Do Title',
              title: 'To-Do Title',
            ),
            const Gap(30),
            const CategorySelectionWidget(),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    hintText: 'Date',
                    title: 'Date',
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.calendar),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: CommonTextField(
                    hintText: 'Time',
                    title: 'Time',
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.clock),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            const CommonTextField(
              hintText: 'Notes',
              title: 'Notes',
              maxLines: 6,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: AppTextWhite(text: 'Save'),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
