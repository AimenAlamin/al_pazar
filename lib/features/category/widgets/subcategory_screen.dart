import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/routes.dart';
import '../domain/category_entity.dart';
import '../domain/subcategory_entity.dart';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  // Define subcategories based on the selected category
  List<SubcategoryEntity> getSubcategories() {
    final subcategories = <SubcategoryEntity>[];

    switch (categoryEntity.categoryName) {
      case 'Vehicles':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Cars', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Motorcycles', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Trucks', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Boats', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Real Estate':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Houses for Sale',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Apartments for Rent',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Commercial Properties',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Land Plots', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Electronics':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Mobile Phones', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Laptops', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Cameras', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'TVs', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Home & Furniture':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Living Room Furniture',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Bedroom Furniture',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Kitchen Appliances',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Home Decor', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Clothing & Accessories':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Men\'s Clothing',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Women\'s Clothing',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Shoes', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Jewelry', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Health & Beauty':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Skincare', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Makeup', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Haircare', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Fitness Equipment',
              categoryEntity: categoryEntity),
        ]);
        break;
      case 'Sports & Outdoors':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Camping Gear', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Fitness Equipment',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Bicycles', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Sports Apparel',
              categoryEntity: categoryEntity),
        ]);
        break;
      case 'Hobbies & Entertainment':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Musical Instruments',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Board Games', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Collectibles', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Books', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Jobs':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Full-time Jobs',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Part-time Jobs',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Freelance Work',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Remote Jobs', categoryEntity: categoryEntity),
        ]);
        break;
      case 'Services':
        subcategories.addAll([
          SubcategoryEntity(
              subcategoryName: 'Home Services', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Repair Services',
              categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Tutoring', categoryEntity: categoryEntity),
          SubcategoryEntity(
              subcategoryName: 'Event Planning',
              categoryEntity: categoryEntity),
        ]);
        break;
    }

    return subcategories;
  }

  @override
  Widget build(BuildContext context) {
    final subcategories = getSubcategories();

    return Scaffold(
      appBar: AppBar(
        title: Text('${categoryEntity.categoryName} '),
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcategories[index].subcategoryName),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              SubcategoryEntity subcategoryEntity = subcategories[index];
              context.pushNamed(Routes.testScreen,
                  arguments: subcategoryEntity);
              // Handle subcategory click
              // For now, just print the selected subcategory
              //print('Selected Subcategory: ${subcategories[index].subcategoryName}');
            },
          );
        },
      ),
    );
  }
}
