import 'package:al_pazar/features/add_post/presenation/view/add_category_screen.dart';

import 'package:al_pazar/features/home/presentation/ui/widgets/account_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/chats/presentation/chat_view.dart';
import 'features/home/presentation/ui/widgets/myads_view.dart';
import 'features/home/presentation/ui/widgets/home_view.dart';
import 'features/home/presentation/ui/widgets/navigationbar/custom_bottom_navbar.dart';

import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  //my main screen/view which contains the bottom navigation bar and their screens/
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavbar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
            20.0.r,
            16.0.r,
            20.0.r,
            28.0.r,
          ),
          child: IndexedStack(
            //indexed stack is used to show the current view index without losing the state of the previous view to avoid rebuilding the view
            index: currentViewIndex,
            children: [
              const HomeView(),
              const MyAdsView(),
              AddCategoryScreen(),
              const ChatView(),
              const AccountView(),
            ],
          ),
        ),
      ),
    );
  }
}
