import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/features/login/login_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class accountPage extends StatelessWidget {
  accountPage({super.key});

  List<Map<String, dynamic>> accountDetails = [
    {
      "Icon": Icons.person,
      "Text": "Profile",
    },
    {
      "Icon": Icons.wallet,
      "Text": "Sales",
    },
    {
      "Icon": Icons.favorite,
      "Text": "favorite",
    },
    {
      "Icon": Icons.notifications,
      "Text": "notification",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        verticalSpace(70),
        Container(
          padding: EdgeInsets.all(25),
          color: const Color.fromARGB(255, 244, 235, 235),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 206, 204, 203),
                  border: Border.all(
                      color: const Color.fromARGB(255, 164, 162, 162)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deogracias wamp",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Joinded on october 2024",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        // Expanded(
        //   child: ListView.builder(
        //       physics: NeverScrollableScrollPhysics(),
        //       itemCount: accountDetails.length,
        //       itemBuilder: (context, int index) {
        //         return Container(
        //           height: 70,
        //           decoration: const BoxDecoration(
        //               border: Border(
        //                   bottom: const BorderSide(
        //                       color: Color.fromARGB(33, 94, 92, 92)))),
        //           child: ListTile(
        //             leading: Icon(
        //               accountDetails[index]["Icon"],
        //               color: Color.fromARGB(255, 29, 28, 28),
        //             ),
        //             title: Text(accountDetails[index]['Text']),
        //             trailing: Icon(Icons.arrow_right),
        //           ),
        //         );
        //       }),
        // ),
        Expanded(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.profile);
                },
                child: Container(
                  height: 90,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: const BorderSide(
                              color: Color.fromARGB(33, 94, 92, 92)))),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.person_2_outlined,
                        color: Color.fromARGB(255, 29, 28, 28),
                      ),
                      title: Text("Profile"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.sale);
                },
                child: Container(
                  height: 90,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: const BorderSide(
                              color: Color.fromARGB(33, 94, 92, 92)))),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.wallet_rounded,
                        color: Color.fromARGB(255, 29, 28, 28),
                      ),
                      title: Text("Sales"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.favoritesScreen);
                },
                child: Container(
                  height: 90,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: const BorderSide(
                              color: Color.fromARGB(33, 94, 92, 92)))),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.favorite_outline,
                        color: Color.fromARGB(255, 29, 28, 28),
                      ),
                      title: Text("Favorite"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.notification);
                },
                child: Container(
                  height: 90,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: const BorderSide(
                              color: Color.fromARGB(33, 94, 92, 92)))),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications_outlined,
                        color: Color.fromARGB(255, 29, 28, 28),
                      ),
                      title: Text("Notification"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(10),
              Container(
                height: 70,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: const BorderSide(
                            color: Color.fromARGB(33, 94, 92, 92)))),
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.nat_outlined,
                      color: Color.fromARGB(255, 29, 28, 28),
                    ),
                    title: Text(
                      "Log out",
                      style: TextStyle(
                          color: ColorsManager.mainBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 14.0),
        //     child: Text(
        //       "Log out",
        //       style: TextStyle(
        //           color: Colors.red, fontWeight: FontWeight.w800, fontSize: 20),
        //     ),
        //   ),
        // ),
      ]),
    ));
  }
}
