import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:al_pazar/core/theming/widgets/custom_app_bar.dart';
import 'package:al_pazar/features/post_detials/widgets/custom_post_detials_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetialsScreen extends StatelessWidget {
  const PostDetialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context,
          title: "", showFavouriteButton: true, showShareButton: true),
      bottomNavigationBar: const CustomPostDetialsNavbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350.h,
              width: double.infinity,
              child: Image.asset(
                "assets/images/room.jpg",
                fit: BoxFit.cover,
              ),
            ),
            // Add padding around all text elements
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eur 500",
                    style: TextStyles.font20BlueBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(2),
                  Text(
                    "New room for rent",
                    style: TextStyles.font16DarkBlueBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Text(
                        "Magusa",
                        style: TextStyles.font14DarkerGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        "12.12.2024",
                        style: TextStyles.font14DarkerGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  const Divider(
                    // The line separator
                    color: ColorsManager.lighterGray, // Light gray color
                    thickness: 3, // Line thickness
                  ),
                  verticalSpace(16),
                  Text(
                    "Description",
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  verticalSpace(5),
                  Text(
                    "This is a new room for rent in Magusa. The room is fully furnished and has a private bathroom. The room is located in a quiet area and is close to the city center. The room is available for rent from 1st January 2022. The rent is 500 euros per month. The room is suitable for students or working professionals. \nFor more information, please contact us. serious inquiries only.",
                    style: TextStyles.font14DarkBlueRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
