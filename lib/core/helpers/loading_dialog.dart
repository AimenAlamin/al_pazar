import 'package:flutter/material.dart';

Future<dynamic> customLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 75, 23, 23),
      ),
    ),
  );
}
