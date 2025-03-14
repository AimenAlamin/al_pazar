import 'package:al_pazar/core/helpers/spacing.dart';

import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';

import 'package:al_pazar/features/post_detials/widgets/custom_post_detials_navbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/custom_timeago.dart';
import '../add_post/domain/entities/post_entity.dart';
import 'transparent_app_bar.dart';

class PostDetialsScreen extends StatelessWidget {
  const PostDetialsScreen({super.key, required this.postDetails});
  final PostEntity postDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomPostDetialsNavbar(
        postDetails: postDetails,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image slider
                SizedBox(
                  height: 350.h,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: postDetails.imageUrl!.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        postDetails.imageUrl![index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 350.h,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0.w, vertical: 10.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${postDetails.currency} ${postDetails.price}',
                        style: TextStyles.font20BlueBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(2),
                      Text(
                        postDetails.title,
                        style: TextStyles.font16DarkBlueBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(4),
                      Row(
                        children: [
                          Text(
                            postDetails.location,
                            style: TextStyles.font14DarkerGrayRegular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Text(
                            TimeAgoHelper.getTimeAgo(postDetails.timestamp),
                            style: TextStyles.font14DarkerGrayRegular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      const Divider(
                        color: ColorsManager.lighterGray,
                        thickness: 3,
                      ),
                      verticalSpace(10),
                      Text(
                        "Detials",
                        style: TextStyles.font18DarkBlueBold,
                      ),
                      verticalSpace(6),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Condtion",
                              style: TextStyles.font14DarkBlueMedium,
                            ),
                            TextSpan(
                              text: ' : ',
                              style: TextStyles.font14DarkBlueBold,
                            ),
                            TextSpan(
                              text: postDetails.condition!,
                              style: TextStyles.font14DarkBlueRegular,
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "payment Options",
                              style: TextStyles.font14DarkBlueMedium,
                            ),
                            TextSpan(
                              text: ' : ',
                              style: TextStyles.font14DarkBlueBold,
                            ),
                            TextSpan(
                              text: postDetails.paymentOptions!.join(", "),
                              style: TextStyles.font14DarkBlueRegular,
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(8),
                      const Divider(
                        color: ColorsManager.lighterGray,
                        thickness: 3,
                      ),
                      verticalSpace(10),
                      Text(
                        "Description",
                        style: TextStyles.font18DarkBlueBold,
                      ),
                      verticalSpace(5),
                      Text(
                        postDetails.description!,
                        style: TextStyles.font14DarkBlueRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Transparent AppBar on top of the image
            const TransparentAppBar(),
          ],
        ),
      ),
    );
  }
}
