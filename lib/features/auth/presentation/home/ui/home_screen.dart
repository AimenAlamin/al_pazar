import 'package:al_pazar/features/auth/presentation/home/ui/widgets/categories_see_all.dart';
import 'package:al_pazar/features/auth/presentation/home/ui/widgets/home_topbar.dart';
import 'package:al_pazar/features/auth/presentation/home/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import 'widgets/explore_categories_listview.dart';

import 'widgets/popular_listview_items.dart';

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
          child: SingleChildScrollView(
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
                const CategoriesSeeAll(text: "Cars For Sale"),
                verticalSpace(12),
                const PopularListviewItems(
                    imageAsset: "assets/images/defaultcar.jpg",
                    price: "TL 15000",
                    title: "Honda Vezel 2020",
                    location: "Magusa"),
                verticalSpace(28),
                const CategoriesSeeAll(text: "Residentials For Rent"),
                verticalSpace(12),
                const PopularListviewItems(
                    imageAsset: "assets/images/livingroom.jpg",
                    price: "TL 52000",
                    title: "Luxury Villa",
                    location: "Keyrenia"),
                verticalSpace(28),
                const CategoriesSeeAll(text: "Rooms For Rent"),
                verticalSpace(12),
                const PopularListviewItems(
                    imageAsset: "assets/images/room.jpg",
                    price: "TL 8000",
                    title: "Room in 3+1 for Rent",
                    location: "Lefkosa"),
                verticalSpace(28),
                const CategoriesSeeAll(text: "Cars For Sale"),
                verticalSpace(12),
                const PopularListviewItems(
                    imageAsset: "assets/images/defaultcar.jpg",
                    price: "TL 15000",
                    title: "Honda Vezel 2020",
                    location: "Magusa"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
