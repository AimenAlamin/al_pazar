import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errtext});
  final String errtext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errtext,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
    );
  }
}
