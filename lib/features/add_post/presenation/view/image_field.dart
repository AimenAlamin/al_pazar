import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      width: double.infinity,
      child: Icon(
        Icons.image_outlined,
        size: 100,
      ),
    );
  }
}
