import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/utils.dart';

import 'widgets.dart';

class ErrorMsgWidget extends StatelessWidget {
  const ErrorMsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return CommonContainer(
      width: deviceSize.width,
      height: deviceSize.height * 0.3,
      child: const Center(child: Text('Something went wrong')),
    );
  }
}
