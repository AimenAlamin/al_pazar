import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';
import 'package:al_pazar/core/services/dependency_injection.dart';
import 'package:al_pazar/features/add_post/domain/repos/posts_repo/post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_filter_view_body.dart';

class SubCategoryFilterView extends StatelessWidget {
  final String subCategoryName;

  const SubCategoryFilterView({super.key, required this.subCategoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchPostCubit(getIt<PostRepo>()),
      child: SubCategoryFilterViewBody(subCategoryName: subCategoryName),
    );
  }
}
