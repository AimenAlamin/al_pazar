import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../theming/styles.dart';

void setupErrorState(BuildContext context, String error) {
  context.pop(); //pop from the loading dialog
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
