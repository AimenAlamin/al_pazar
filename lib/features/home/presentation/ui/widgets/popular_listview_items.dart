import '../../../../add_post/domain/entities/post_entity.dart';
import 'popular_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularListviewItems extends StatelessWidget {
  const PopularListviewItems({
    super.key,
    required this.posts,
  });
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: PopularItem(
              posts: posts[index],
            ),
          );
        },
      ),
    );
  }
}
