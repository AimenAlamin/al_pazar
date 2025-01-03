import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/dependency_injection.dart';
import '../../../../add_post/domain/repos/posts_repo/post_repo.dart';
import 'category_filter_view_body.dart';

class CategoryFilterView extends StatelessWidget {
  final String categoryName;

  const CategoryFilterView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchPostCubit(getIt<PostRepo>()),
      child: CategoryFilterViewBody(categoryName: categoryName),
    );
  }
}
