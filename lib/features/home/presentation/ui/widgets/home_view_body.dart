import 'package:al_pazar/core/common/widgets/image_sliding.dart';
import 'package:al_pazar/features/home/presentation/ui/widgets/popular_listview_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/cubit/fetch_post_cubit.dart';
import '../../../../../core/helpers/spacing.dart';
import 'categories_see_all.dart';
import 'explore_categories_listview.dart';
import 'home_topbar.dart';

import 'popular_listview_items.dart';
import 'posts_listed_view_bloc_builder.dart';
import 'search_textfield.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<FetchPostCubit>().fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTopBar(),
          verticalSpace(8),
          const SearchTextfield(),
          verticalSpace(23),
          const CategoriesSeeAll(text: "Explore Categories"),
          verticalSpace(18),
          //const PostsListedview(),
          const ExploreCategoriesListView(),
          verticalSpace(18),
          SizedBox(
            height: 160.h,
            width: MediaQuery.of(context).size.width,
            child: const ImageSlider(),
          ),
          verticalSpace(38),
          // const PostsListedViewBlocBuilder(),
          const CategoriesSeeAll(text: "Cars For Sale"),
          verticalSpace(12),
          const PopularListViewBlocBuilder(),
          verticalSpace(48),
          const CategoriesSeeAll(text: "Residentials For Rent"),
          verticalSpace(12),
          const PopularListViewBlocBuilder(),
          verticalSpace(48),
          const CategoriesSeeAll(text: "Rooms For Rent"),
          verticalSpace(12),
          const PopularListViewBlocBuilder(),
          verticalSpace(48),
          const CategoriesSeeAll(text: "Electronics For Sale"),
          verticalSpace(12),
          const PopularListViewBlocBuilder(),
          verticalSpace(48),
          const CategoriesSeeAll(text: "Furniture For Sale"),
          verticalSpace(12),
          const PopularListViewBlocBuilder(),
        ],
      ),
    );
  }
}
