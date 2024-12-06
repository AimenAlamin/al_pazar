import 'package:al_pazar/features/home/presentation/ui/widgets/popular_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularListviewItems extends StatelessWidget {
  const PopularListviewItems({
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
      height: 190.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: PopularItem(
                imageAsset: imageAsset,
                price: price,
                title: title,
                location: location),
          );
        },
      ),
    );
  }
}
