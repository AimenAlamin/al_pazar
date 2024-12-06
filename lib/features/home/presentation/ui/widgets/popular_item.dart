import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.imageAsset,
    required this.price,
    required this.title,
    required this.location,
  });
  final String imageAsset;
  final String price;
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w, // Fixed width
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 232, 232),
            //color: const Color.fromARGB(255, 152, 150, 150),
            width: 2.0.w,
          ),
          borderRadius: BorderRadius.circular(12.0.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12.0.r),
              ),
              child: Image.asset(
                width: 150.w,
                height: 105.h,
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0.w, top: 5.0.h),
              child: Text(
                price,
                style: TextStyles.font20BlueBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0.w, bottom: 2.0.h),
              child: Text(
                title,
                style: TextStyles.font14DarkBlueMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0.w, bottom: 5.0.h),
              child: Text(
                location,
                style: TextStyles.font12GrayMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
