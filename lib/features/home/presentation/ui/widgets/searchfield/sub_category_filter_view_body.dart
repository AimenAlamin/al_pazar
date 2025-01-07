import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';
import 'package:al_pazar/core/theming/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts_listed_view_bloc_builder.dart';

class SubCategoryFilterViewBody extends StatefulWidget {
  const SubCategoryFilterViewBody({
    super.key,
    required this.subCategoryName,
  });

  final String subCategoryName;

  @override
  State<SubCategoryFilterViewBody> createState() =>
      _CategoryFilterViewBodyState();
}

class _CategoryFilterViewBodyState extends State<SubCategoryFilterViewBody> {
  @override
  void initState() {
    context
        .read<FetchPostCubit>()
        .fetchPostsBySubCategory(widget.subCategoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.subCategoryName),
      //   centerTitle: true,
      // ),
      appBar: buildAppBar(context,
          title: widget.subCategoryName, showFilterButton: true),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostsListedViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
