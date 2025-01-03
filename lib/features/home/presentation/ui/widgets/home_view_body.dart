import 'package:al_pazar/core/common/widgets/image_sliding.dart';

import 'package:al_pazar/features/home/presentation/ui/widgets/popular_listview_bloc_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/cubit/fetch_post_cubit.dart';
import '../../../../../core/helpers/spacing.dart';

import 'explore_categories_listview.dart';
import 'home_topbar.dart';

import 'searchfield/search_textfield.dart';
import 'see_all.dart';

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
          const SeeAll(text: "Explore Categories"),
          verticalSpace(18),
          const ExploreCategoriesListView(),
          verticalSpace(18),
          SizedBox(
            height: 160.h,
            width: double.infinity,
            child: const ImageSlider(),
          ),
          verticalSpace(38),
          const SeeAll(text: "Featured Listings"),
          verticalSpace(15),
          const PopularListViewBlocBuilder(),
        ],
      ),
    );
  }
}
