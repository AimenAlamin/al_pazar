import 'package:al_pazar/core/theming/colors.dart';
import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        backgroundColor: ColorsManager.whiteColors,
      ),
      body: Expanded(
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      // shadowColor: Colors.black,
                      color: const Color.fromARGB(188, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                      ),
                      elevation: 4, // Adds shadow
                      shadowColor: Colors.grey.shade300, // Shadow effect
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.all(12.0), // Add padding
                        leading: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(50.0), // Rounded corners
                          child: Image.network(
                            "https://img.freepik.com/premium-photo/interior-home_1048944-30786189.jpg?w=1380",
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        trailing: Text(
                          "\$344",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.mainBlue, // Emphasize price
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lenovo for Sale",
                              style: TextStyle(
                                color: ColorsManager.mainBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Wed, 20:46",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "This is a long piece of text that will be truncated with ellipsis 123MB 47RAM Intel.",
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                              height: 1.4, // Line height for better readability
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, // Adds '...'
                          ),
                        ),
                      ),
                    ));
              })),
    );
  }
}
