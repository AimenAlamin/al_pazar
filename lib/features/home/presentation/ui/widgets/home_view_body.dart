import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/cubit/fetch_post_cubit.dart';
import '../../../../../core/helpers/spacing.dart';
import 'categories_see_all.dart';
import 'explore_categories_listview.dart';
import 'home_topbar.dart';

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
          verticalSpace(24),
          const SearchTextfield(),
          verticalSpace(18),
          const CategoriesSeeAll(text: "Check me out"),
          verticalSpace(18),
          //const PostsListedview(),
          const ExploreCategoriesListView(),
          verticalSpace(28),
          const PostsListedViewBlocBuilder(),
          // const CategoriesSeeAll(text: "Cars For Sale"),
          // verticalSpace(12),
          // const PopularListviewItems(
          //     imageAsset: "assets/images/defaultcar.jpg",
          //     price: "TL 15000",
          //     title: "Honda Vezel 2020",
          //     location: "Magusa"),
          // verticalSpace(28),
          // const CategoriesSeeAll(text: "Residentials For Rent"),
          // verticalSpace(12),
          // const PopularListviewItems(
          //     imageAsset: "assets/images/livingroom.jpg",
          //     price: "TL 52000",
          //     title: "Luxury Villa",
          //     location: "Keyrenia"),
          // verticalSpace(28),
          // const CategoriesSeeAll(text: "Rooms For Rent"),
          // verticalSpace(12),
          // const PopularListviewItems(
          //     imageAsset: "assets/images/room.jpg",
          //     price: "TL 8000",
          //     title: "Room in 3+1 for Rent",
          //     location: "Lefkosa"),
          // verticalSpace(28),
          // const CategoriesSeeAll(text: "Cars For Sale"),
          // verticalSpace(12),
          // const PopularListviewItems(
          //     imageAsset: "assets/images/defaultcar.jpg",
          //     price: "TL 15000",
          //     title: "Honda Vezel 2020",
          //     location: "Magusa"),
        ],
      ),
    );
  }
}
