import 'package:flutter/material.dart';

class Sale extends StatelessWidget {
  const Sale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales"),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 23.0,
            childAspectRatio: 0.8,
          ),
          itemCount: 7,
          itemBuilder: ((context, index) {
            return Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255,
                      255), // Background color for the neumorphic effect
                  borderRadius:
                      BorderRadius.circular(10), // Rounded corners (optional)
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 252, 252, 252)
                          .withOpacity(0.7), // Light shadow for top-left
                      offset: const Offset(-5, -5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.10), // Dark shadow for bottom-right
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
                            "https://img.freepik.com/free-photo/modern-house-exterior_1232-2241.jpg?w=360",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Electronic",
                          ),
                          Icon(
                            Icons.card_giftcard,
                            color: Color.fromARGB(255, 247, 0, 0),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Text(
                          "Lenovo",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Text.rich(
                          TextSpan(
                            // Main text
                            children: <TextSpan>[
                              TextSpan(
                                text: "lenovo for sales 45price  16RAM Intel",
                                style: TextStyle(
                                    // Apply bold to "jdj"
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "\$ 450",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      )
                    ]));
          })),
    );
  }
}
