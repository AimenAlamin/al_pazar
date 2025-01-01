import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreCategoriesListView extends StatelessWidget {
  const ExploreCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Predefined list of categories with corresponding icons
    final categories = [
      {"name": "Vechiles", "icon": "assets/svgs/car-rear-solid.svg"},
      {"name": "Real Estate", "icon": "assets/svgs/hotel.svg"},
      {"name": "Electronics", "icon": "assets/svgs/mobile-screen-solid.svg"},
      {"name": "Home Appliances", "icon": "assets/svgs/kitchen-set-solid.svg"},
      {"name": "Furniture", "icon": "assets/svgs/couch-solid.svg"},
      {"name": "Education", "icon": "assets/svgs/book-solid.svg"},
      {"name": "Fashions", "icon": "assets/svgs/glasses-solid.svg"},
      {"name": "Entertainment", "icon": "assets/svgs/icons-solid.svg"},
      {"name": "Pets", "icon": "assets/svgs/cat-solid.svg"},
      {"name": "Jobs", "icon": "assets/svgs/job.svg"},
      {"name": "Services", "icon": "assets/svgs/hand-holding-dollar-solid.svg"},
      {"name": "Lost & Found", "icon": "assets/svgs/Lost-Found.svg"},
    ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Navigate to a new page with the selected category name
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailScreen(categoryName: category['name']!),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightRead,
                    child: SvgPicture.asset(
                      category['icon']!, // Use category-specific icon
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  Text(
                    category['name']!,
                    style: TextStyles.font12DarkBlueRegular,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;

  const CategoryDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to $categoryName',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
