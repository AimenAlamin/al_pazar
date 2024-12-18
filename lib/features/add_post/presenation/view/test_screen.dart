import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen(
      {super.key,
      required this.selectedCategory,
      required this.selectedSubcategory});
  final String selectedCategory;
  final String selectedSubcategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' $selectedCategory'),
            Text(' $selectedSubcategory'),
          ],
        ),
      ),
    );
  }
}
