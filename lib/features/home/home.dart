import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/features/account/AccountScreen.dart';

import 'package:flutter/material.dart';

import 'package:al_pazar/features/account/AccountScreen.dart';

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Text("");
            }));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(child: _pages[track_currentPage]),
      bottomNavigationBar: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: BottomNavigationBar(
            currentIndex: track_currentPage,
            onTap: (int Newindex) {
              track_currentPage = Newindex;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 16, // Set selected label size
            unselectedFontSize: 14, // Set unselected label size
            selectedIconTheme:
                const IconThemeData(size: 22), // Set selected icon size
            unselectedIconTheme: const IconThemeData(size: 20),
            selectedItemColor: const Color.fromARGB(
                255, 226, 47, 47), // Custom color for selected item
            unselectedItemColor: const Color.fromARGB(255, 77, 76, 76),
            selectedLabelStyle: const TextStyle(
                color: Color.fromARGB(
                    255, 226, 47, 47)), // Color for selected label
            unselectedLabelStyle: const TextStyle(
              color: ColorsManager.darkBlue,
            ),
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: 'favorite',
                  icon: Icon(
                    Icons.favorite,
                  )),
              BottomNavigationBarItem(
                  label: 'chats',
                  icon: Icon(
                    Icons.message,
                  )),
              BottomNavigationBarItem(
                  label: 'Accounts',
                  icon: Icon(
                    Icons.home,
                  )),
            ]),
      ),
    );
  }
}
