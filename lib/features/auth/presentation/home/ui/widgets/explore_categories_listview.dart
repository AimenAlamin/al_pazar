import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExploreCategoriesListView extends StatelessWidget {
  const ExploreCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Predefined list of categories with corresponding icons
    // final categories = [
    //   {'name': 'Cars', 'icon': 'assets/svgs/cars.svg'},
    //   // {'name': 'Food', 'icon': 'assets/svgs/car2.svg'},
    //   // {'name': 'Mobiles', 'icon': 'assets/svgs/car3.svg'},
    //   // {'name': 'Books', 'icon': 'assets/svgs/books.svg'},
    //   // {'name': 'Fashion', 'icon': 'assets/svgs/fashion.svg'},
    //   // {'name': 'Sports', 'icon': 'assets/svgs/car6.svg'},
    //   // {'name': 'Music', 'icon': 'assets/svgs/car7.svg'},
    //   // {'name': 'Travel', 'icon': 'assets/svgs/car8.svg'},
    // ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          //final category = categories[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightRead,
                  child: SvgPicture.asset(
                    "assets/svgs/cars.svg", // Use category-specific icon
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                verticalSpace(8),
                Text(
                  "Cars", // Use category-specific name
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
