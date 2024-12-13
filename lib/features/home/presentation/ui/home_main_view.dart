import 'package:al_pazar/features/add_post/presenation/view/add_post_view.dart';
import 'package:al_pazar/features/home/presentation/ui/widgets/account_view.dart';

import '../../../chats/chat_view.dart';
import 'widgets/favorites_view.dart';
import 'widgets/home_view.dart';
import 'widgets/navigationbar/custom_bottom_navbar.dart';

import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  //my main screen/view which contains the bottom navigation bar and their screens/
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavbar(
        onItemTapped: onItemTapped,
      ),
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
          child: getCurrentView(),
        ),
      ),
    );
  }

  Widget getCurrentView() {
    return [
      const HomeView(),
      const FavoritesView(),
      const AddPostView(),
      const ChatView(),
      const AccountView(),
    ][currentViewIndex];
  }
}
