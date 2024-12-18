import 'package:al_pazar/core/helpers/category_subcategory_constant.dart';
import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});
  final List<String> categories = [
    CategoryConstants.kVehicles,
    CategoryConstants.kRealEstate,
    CategoryConstants.kElectronics,
    CategoryConstants.kHomeFurniture,
    CategoryConstants.kClothingAccessories,
    CategoryConstants.kHealthBeauty,
    CategoryConstants.kSportsOutdoors,
    CategoryConstants.kHobbiesEntertainment,
    CategoryConstants.kJobs,
    CategoryConstants.kServices,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What are you offering?'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to a new screen or handle category click

              // categoryEntity.categoryName = categories[index];
              context.pushNamed(Routes.addsubCategoryScreen,
                  arguments: categories[index]);
            },
          );
        },
      ),
    );
  }
}
