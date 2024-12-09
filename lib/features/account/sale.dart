import 'package:al_pazar/core/theming/colors.dart';
import 'package:flutter/material.dart';

class Sale extends StatelessWidget {
  const Sale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sales",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 13.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.8,
          ),
          itemCount: 7,
          itemBuilder: ((context, index) {
            return Container(
                width: 600,
                height: 900,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      blurRadius: 8, // Softness of the shadow
                      spreadRadius: 2, // How wide the shadow spreads
                      offset: Offset(4, 4), // Shadow position (x, y)
                    ),
                  ],
                ),
                //  decoration: const BoxDecoration(color: Colors.red),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          height: 140,
                          //color: Colors.amberAccent,
                          child: Image.network(
                            "https://img.freepik.com/free-photo/modern-house-exterior_1232-2241.jpg?w=360",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        //  color: const Color.fromARGB(255, 54, 152, 244),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Electronic",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.card_giftcard,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                "lenovo",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                    text:
                                        "This is a long piece of text that will be truncated with ellipsis 123mb 47ram intel ",
                                    style: TextStyle(
                                        color: ColorsManager.gray,
                                        fontSize: 13)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
                              child: Text(
                                "\$670",
                                style: TextStyle(
                                    color: ColorsManager.gray,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                    ]));
          })),
    );
  }
}
