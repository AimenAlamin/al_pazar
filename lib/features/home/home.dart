import 'package:al_pazar/core/theming/colors.dart';

import 'package:flutter/material.dart';

import 'package:al_pazar/features/account/Account.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  int track_currentPage = 0;
  List<Widget> _pages = [
    const Text("Home"),
    const Text("favorite"),
    const Text("Chat"),
    accountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[track_currentPage]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: track_currentPage,
          onTap: (int Newindex) {
            track_currentPage = Newindex;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14, // Set selected label size
          unselectedFontSize: 13,
          unselectedIconTheme: const IconThemeData(size: 20),
          selectedItemColor:
              ColorsManager.mainBlue, // Custom color for selected item
          // set unselected label size

          unselectedItemColor: ColorsManager.lightGray,
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home, color: ColorsManager.mainBlue)),
            BottomNavigationBarItem(
                label: 'favorite',
                icon: Icon(
                  Icons.favorite,
                  color: ColorsManager.mainBlue,
                )),
            BottomNavigationBarItem(
                label: 'chats',
                icon: Icon(
                  Icons.message,
                  color: ColorsManager.mainBlue,
                )),
            BottomNavigationBarItem(
                label: 'Accounts',
                icon: Icon(Icons.home, color: ColorsManager.mainBlue)),
          ]),
    );
  }
}
