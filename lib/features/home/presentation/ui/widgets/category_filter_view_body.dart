import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';
import 'package:al_pazar/core/theming/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_listed_view_bloc_builder.dart';

class CategoryFilterViewBody extends StatefulWidget {
  const CategoryFilterViewBody({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  State<CategoryFilterViewBody> createState() => _CategoryFilterViewBodyState();
}

class _CategoryFilterViewBodyState extends State<CategoryFilterViewBody> {
  @override
  void initState() {
    context.read<FetchPostCubit>().fetchPostsByCategory(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: widget.categoryName, showFilterButton: true),
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
