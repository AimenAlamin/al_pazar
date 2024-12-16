import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import 'filters.dart';

AppBar buildAppBar(context,
    {required String title,
    bool showBackButton = true,
    bool showFilterButton = false,
    bool showShareButton = false,
    bool showFavouriteButton = false}) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Visibility(
        visible: showFilterButton,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: const FilterWidget(),
        ),
      ),
      Visibility(
        visible: showFavouriteButton,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.favorite_outline_outlined,
            ),
          ),
        ),
      ),
      Visibility(
        visible: showShareButton,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.share_outlined,
            ),
          ),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.font18DarkBlueBold,
    ),
  );
}
