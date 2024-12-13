import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/helpers/custom_timeago.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdItem extends StatelessWidget {
  const AdItem({
    super.key,
    required this.posts,
  });
  final PostEntity posts;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 236, 236, 236),
          width: 1.0.w,
        ),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              posts.imageUrl!,
              width: 110.w,
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${posts.currency} ${posts.price}',
                  style: TextStyles.font20BlueBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Text(
                  posts.title,
                  style: TextStyles.font14DarkBlueMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Text(
                  posts.location,
                  style: TextStyles.font13GrayMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Text(
                  TimeAgoHelper.getTimeAgo(posts.timestamp),
                  style: TextStyles.font13GrayMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
