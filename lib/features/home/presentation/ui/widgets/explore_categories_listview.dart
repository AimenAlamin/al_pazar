import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';

import '../../../../../core/helpers/category_subcategory_constant.dart';
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
      {
        "name": CategoryConstants.kVehicles,
        "icon": "assets/svgs/car-rear-solid.svg"
      },
      {"name": CategoryConstants.kRealEstate, "icon": "assets/svgs/hotel.svg"},
      {
        "name": CategoryConstants.kElectronics,
        "icon": "assets/svgs/mobile-screen-solid.svg"
      },
      {
        "name": CategoryConstants.kHomeAppliances,
        "icon": "assets/svgs/kitchen-set-solid.svg"
      },
      {
        "name": CategoryConstants.kFurniture,
        "icon": "assets/svgs/couch-solid.svg"
      },
      {
        "name": CategoryConstants.kEducation,
        "icon": "assets/svgs/book-solid.svg"
      },
      {
        "name": CategoryConstants.kFashion,
        "icon": "assets/svgs/glasses-solid.svg"
      },
      {
        "name": CategoryConstants.kEntertainment,
        "icon": "assets/svgs/icons-solid.svg"
      },
      {
        "name": CategoryConstants.kSelfCare,
        "icon": "assets/svgs/spray-can-sparkles-solid.svg"
      },
      {"name": CategoryConstants.kPets, "icon": "assets/svgs/cat-solid.svg"},
      {"name": CategoryConstants.kJobs, "icon": "assets/svgs/job.svg"},
      {
        "name": CategoryConstants.kServices,
        "icon": "assets/svgs/hand-holding-dollar-solid.svg"
      },
      {
        "name": CategoryConstants.kLostFound,
        "icon": "assets/svgs/Lost-Found.svg"
      },
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
              context.pushNamed(Routes.categoryFilterView,
                  arguments: category['name']!);
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
