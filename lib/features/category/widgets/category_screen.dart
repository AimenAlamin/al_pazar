import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../domain/category_entity.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  // List of 10 common categories
  final List<String> categories = [
    'Vehicles',
    'Real Estate',
    'Electronics',
    'Home & Furniture',
    'Clothing & Accessories',
    'Health & Beauty',
    'Sports & Outdoors',
    'Hobbies & Entertainment',
    'Jobs',
    'Services',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Screen'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to a new screen or handle category click
              CategoryEntity categoryEntity =
                  CategoryEntity(categoryName: categories[index]);
              // categoryEntity.categoryName = categories[index];
              context.pushNamed(Routes.subCategoryScreen,
                  arguments: categoryEntity);
            },
          );
        },
      ),
    );
  }
}
