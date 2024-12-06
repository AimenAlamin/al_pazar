import 'package:flutter/material.dart';

import '../../../../domain/entities/bottom_navbar_entity.dart';
import 'active_navbar_item.dart';
import 'not_active_button_navbar.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem(
      {super.key, required this.isSelected, required this.bottomNavbarEntity});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavbarEntity;
  @override
  Widget build(BuildContext context) {
    //check each item in the navigation bar if the item is selected or not and return the appropriate widget because we have two types here
    return isSelected
        ? ActiveItem(
            image: bottomNavbarEntity.activeImage,
            text: bottomNavbarEntity.name,
          )
        : NotActive(
            image: bottomNavbarEntity.inActiveImage,
            text: bottomNavbarEntity.name,
          );
  }
}
