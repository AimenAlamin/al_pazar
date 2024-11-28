import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
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
        verticalSpace(50),
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
        Expanded(
          child: ListView.builder(
              itemCount: accountDetails.length,
              itemBuilder: (context, int index) {
                return Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: const BorderSide(
                              color: Color.fromARGB(33, 94, 92, 92)))),
                  child: ListTile(
                    leading: Icon(
                      accountDetails[index]["Icon"],
                      color: Color.fromARGB(255, 29, 28, 28),
                    ),
                    title: Text(accountDetails[index]['Text']),
                    trailing: Icon(Icons.arrow_right),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 60,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              "Log out",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
        ),
      ]),
    ));
  }
}
