import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.favorite_outline_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
