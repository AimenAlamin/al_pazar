import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/helpers/custom_timeago.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdItem extends StatefulWidget {
  const AdItem({
    super.key,
    required this.posts,
  });
  final PostEntity posts;

  @override
  State<AdItem> createState() => _AdItemState();
}

class _AdItemState extends State<AdItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.postDetailScreen, arguments: widget.posts);
      },
      child: Container(
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
                widget.posts.imageUrl?.isNotEmpty == true
                    ? widget.posts.imageUrl!.first
                    : "assets/images/internetConnectionError.jpeg", // Fallback image URL
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
                    '${widget.posts.currency} ${widget.posts.price}',
                    style: TextStyles.font16BlueBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Text(
                    widget.posts.title,
                    style: TextStyles.font14DarkBlueMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Text(
                    widget.posts.location,
                    style: TextStyles.font13GrayMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Text(
                    TimeAgoHelper.getTimeAgo(widget.posts.timestamp),
                    style: TextStyles.font13GrayMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
