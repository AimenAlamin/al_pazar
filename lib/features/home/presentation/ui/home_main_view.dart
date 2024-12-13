import 'widgets/home_view.dart';
import 'widgets/navigationbar/custom_bottom_navbar.dart';

import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  //my main screen/view which contains the bottom navigation bar and their screens/
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavbar(),
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
            child: const HomeView()),
      ),
    );
  }
}
