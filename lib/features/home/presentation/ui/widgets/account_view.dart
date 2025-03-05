import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/helpers/shared_preferences.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user data
    final String userName = getUserSavedData().name;
    final String firstLetter = userName[0].toUpperCase();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            Row(
              children: [
                Container(
                  width: 75.w,
                  height: 85.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.lightRead,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    firstLetter,
                    style: TextStyles.font32BlueBold,
                  ),
                ),
                horizontalSpace(10),
                Text(
                  userName,
                  style: TextStyles.font20DarkBlueBold,
                ),
              ],
            ),
            verticalSpace(30),
            // Options List Section
            Column(
              children: [
                _buildOptionItem(
                  icon: Icons.person_outline,
                  text: "Profile",
                  onTap: () {
                    // Navigate to Profile screen
                  },
                ),
                verticalSpace(20),
                _buildOptionItem(
                  icon: Icons.sell_outlined,
                  text: "My Ads",
                  onTap: () {
                    // Navigate to My Ads screen
                  },
                ),
                verticalSpace(20),
                _buildOptionItem(
                  icon: Icons.help_outline,
                  text: "Help",
                  onTap: () {
                    // Navigate to Help screen
                  },
                ),
                verticalSpace(20),
                _buildOptionItem(
                  icon: Icons.settings_outlined,
                  text: "Settings",
                  onTap: () {
                    // Navigate to Settings screen
                  },
                ),
                verticalSpace(20),
                _buildOptionItem(
                  icon: Icons.logout,
                  text: "Logout",
                  onTap: () async {
                    try {
                      // Sign out the user
                      await FirebaseAuth.instance.signOut();
                      //clear stored user

                      await Prefs.clear();

                      // Navigate to the login screen
                      context.pushReplacementNamed(Routes.loginEmailScreen);
                    } catch (e) {
                      // Show error message if logout fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error logging out: $e"),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Icon(
              icon,
              size: 39.w,
              color: const Color.fromARGB(255, 66, 0, 97),
            ),
            SizedBox(width: 16.w),
            Text(
              text,
              style: TextStyles.font18DarkBlueBold,
            ),
          ],
        ),
      ),
    );
  }
}
