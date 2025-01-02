import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../add_post/domain/entities/post_entity.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({
    super.key,
    required this.posts,
  });
  final PostEntity posts;

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
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
      child: SizedBox(
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
                child: Image.network(
                  widget.posts.imageUrl?.isNotEmpty == true
                      ? widget.posts.imageUrl!.first
                      : "assets/images/internetConnectionError.jpeg",
                  width: 150.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0.w, top: 5.0.h),
                child: Text(
                  '${widget.posts.currency} ${widget.posts.price}',
                  style: TextStyles.font16BlueBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0.w, bottom: 2.0.h),
                child: Text(
                  widget.posts.title,
                  style: TextStyles.font14DarkBlueMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0.w, bottom: 5.0.h),
                child: Text(
                  widget.posts.location,
                  style: TextStyles.font13GrayMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
