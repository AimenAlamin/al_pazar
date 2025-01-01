import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController userfirstname =
      TextEditingController(text: "Deogracias wamp");

  final TextEditingController userLastname =
      TextEditingController(text: "oleko");

//DateTime _dateOfbirth = DateTime.now(); // Correct variable name
  String formattedDate = "";

  // Use the correct name

  String? _selectedValue;

  @override
  void initState() {
    formattedDate = "15";
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: const BoxDecoration(color: ColorsManager.whiteColors),
          child: const Center(
            child: Text(
              "My profile",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        backgroundColor: ColorsManager.whiteColors,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Profile name",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text(
              "This is played on your profile",
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: ColorsManager.darklight),
            ),
            verticalSpace(20),
            TextField(
              controller: userfirstname,
              decoration: InputDecoration(
                labelText: 'First name',
                labelStyle: const TextStyle(
                    fontSize: 20,
                    color: ColorsManager.darkBlue,
                    fontWeight: FontWeight.w500),

                floatingLabelBehavior: FloatingLabelBehavior.always,

                hintStyle: TextStyle(
                  color: Colors.grey[600], // Hint text color
                  fontSize: 16, // Hint text size
                ),
                filled: true,
                fillColor: Colors.white, // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  borderSide: const BorderSide(
                    color: Colors.grey, // Default border color
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Border color when not focused
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: ColorsManager.darkBlue, // Border color when focused
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // Padding inside the field
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Text color
              ),
            ),
            verticalSpace(20),
            TextField(
              controller: userLastname,
              decoration: InputDecoration(
                labelText: 'Last name',
                labelStyle: const TextStyle(
                    fontSize: 20,
                    color: ColorsManager.darkBlue,
                    fontWeight: FontWeight.w500),

                floatingLabelBehavior: FloatingLabelBehavior.always,

                hintStyle: TextStyle(
                  color: Colors.grey[600], // Hint text color
                  fontSize: 16, // Hint text size
                ),
                filled: true,
                fillColor: Colors.white, // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  borderSide: const BorderSide(
                    color: Colors.grey, // Default border color
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Border color when not focused
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: ColorsManager.darkBlue, // Border color when focused
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // Padding inside the field
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Text color
              ),
            ),
            verticalSpace(20),
            const Text(
              "Account details",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            const Text("This is not visible to other users"),
            GestureDetector(
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1888),
                    lastDate: DateTime(2050),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: ColorsManager
                                .mainBlue, // Header background color
                            onPrimary: Colors.white, // Header text color
                            onSurface: Colors.black, // Body text color
                          ),
                          dialogBackgroundColor: Colors
                              .purple[50], // Background color of the dialog
                        ),
                        child: child!,
                      );
                    }).then((value) {
                  /*  setState(() {
                    _dateOfbirth = value!;
                    formattedDate =
                        DateFormat('dd/MM/yyyy').format(_dateOfbirth);
                  });*/
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorsManager.darklight, width: 1),
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  trailing: Icon(Icons.calendar_month_outlined),
                  title: Text(formattedDate),
                ),
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                Icon(Icons.person_4_rounded),
                const Text(
                  "Gender",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ListTile(
              title: Text("Male"),
              leading: Radio(
                  activeColor: ColorsManager.mainBlue,
                  value: 'Male',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  }),
            ),
            ListTile(
              title: Text("Female"),
              leading: Radio(
                  activeColor: ColorsManager.mainBlue,
                  value: 'Female',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  }),
            ),
            verticalSpace(230),
            Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: ColorsManager.dark,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                        color: ColorsManager.whiteColors,
                        fontWeight: FontWeight.w800),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
