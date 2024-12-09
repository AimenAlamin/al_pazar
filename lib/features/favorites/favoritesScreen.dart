import 'package:al_pazar/core/theming/colors.dart';
import 'package:flutter/material.dart';

class favoriteScreen extends StatelessWidget {
  bool checkFavorite = true;
  favoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "WishList",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 0.68,
            ),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255,
                            255), // Background color for the neumorphic effect
                        borderRadius: BorderRadius.circular(
                            10), // Rounded corners (optional)
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 252, 252, 252)
                                .withOpacity(0.7), // Light shadow for top-left
                            offset: const Offset(-5, -5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.10), // Dark shadow for bottom-right
                            offset: const Offset(5, 5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),

                      //  padding: EdgeInsets.all(14.0),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/orange-color-sports-car-with-sport-decal-road_114579-5071.jpg?w=360",
                                  fit: BoxFit.cover,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Color.fromARGB(255, 12, 12, 12),
                                ),
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Motor cycle for",
                                    textAlign: TextAlign.start,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(8.0),
                                      color: ColorsManager.mainBlue,
                                      child: Text(
                                        "\$345",
                                        style: TextStyle(
                                            color: ColorsManager.whiteColors),
                                      ))
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Text(
                                "Motor",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: const TextSpan(
                                    text:
                                        "This is a long piece of text that will be truncated with ellipsis 123mb 47ram intel ",
                                    style: TextStyle(
                                        color: ColorsManager.gray,
                                        fontSize: 13)),
                              ),
                            ),
                          ])),
                  Positioned(
                    top: 5,
                    right: 10,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: ColorsManager.whiteColors,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              );
            })));
  }
}
