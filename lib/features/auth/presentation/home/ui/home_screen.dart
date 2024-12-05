import 'package:al_pazar/features/auth/presentation/home/ui/widgets/categories_see_all.dart';
import 'package:al_pazar/features/auth/presentation/home/ui/widgets/home_topbar.dart';
import 'package:al_pazar/features/auth/presentation/home/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import 'widgets/explore_categories_listview.dart';
import 'widgets/popular_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              verticalSpace(24),
              const SearchTextfield(),
              verticalSpace(18),
              const CategoriesSeeAll(text: "Explore Categories"),
              verticalSpace(18),
              const ExploreCategoriesListView(),
              verticalSpace(28),
              const CategoriesSeeAll(text: "Popular in Cars"),
              verticalSpace(12),
              const PopularItem(),
            ],
          ),
        ),
      ),
    );
  }
}
