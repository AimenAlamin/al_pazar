import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPostDetialsNavbar extends StatelessWidget {
  const CustomPostDetialsNavbar({super.key, required this.sellerName});
  final String sellerName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightRead, //Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      padding: EdgeInsets.all(25.r),
      child: Row(
        children: [
          // profile pic of seller
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.mediumRed,
              shape: BoxShape.circle,
            ), // BoxDecoration
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_2_outlined),
            ), // IconButton
          ),
          horizontalSpace(5),
          Text(
            sellerName, // Use category-specific name
            style: TextStyles.font14DarkBlueMedium,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.mediumRed,
              shape: BoxShape.circle,
            ), // BoxDecoration
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_outlined),
            ), // IconButton
          ),
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.mediumRed,
              shape: BoxShape.circle,
            ), // BoxDecoration
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone_outlined),
            ), // IconButton
          ),
        ],
      ),
    );
  }
}
