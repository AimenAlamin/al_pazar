import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/ad_item.dart';

class PostsListedview extends StatelessWidget {
  const PostsListedview({super.key, required this.posts});
  final List<PostEntity> posts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return AdItem(
            posts: posts[index],
          );
        },
      ),
    );
  }
}
