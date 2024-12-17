import 'package:al_pazar/features/category/domain/subcategory_entity.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key, required this.subcategoryEntity});

  final SubcategoryEntity subcategoryEntity;
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
            Text('Category: ${subcategoryEntity.categoryEntity.categoryName}'),
            Text('Subcategory: ${subcategoryEntity.subcategoryName}'),
          ],
        ),
      ),
    );
  }
}
