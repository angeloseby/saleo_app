import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saleo_app/widgets/custom_alert_dialog.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TextFormField(
        validator: ((value) {
          if (value!.isEmpty) {
            return "This field can't be null";
          } else if (value.length < 8 || value.length > 20) {
            return "USernames have characters between length 8-20";
          } else if (!RegExp(
                  r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$')
              .hasMatch(value)) {
            return "Enter a valid user name";
          } else {
            return null;
          }
        }),
        controller: controller,
        autocorrect: false,
        keyboardType: TextInputType.text,
        cursorHeight: 25,
        cursorColor: const Color.fromARGB(255, 16, 6, 102),
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 217, 215, 241),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 217, 215, 241),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const CustomAlertDialog(
                    width: 500,
                    height: 250,
                    backgroundColor: Color.fromARGB(255, 175, 215, 234),
                    text:
                        ("Use this field to enter username.\nThe username can have characters upto 8 - 20\nUsername can neither start nor end with _ or .\nUsername can have _ or . between\nNo whitespaces."),
                    textSize: 20),
              );
            },
            icon: const Icon(
              Icons.help,
              color: Color.fromARGB(255, 16, 6, 102),
            ),
          ),
          prefixIcon: const Icon(
            Icons.mail,
            color: Color.fromARGB(255, 16, 6, 102),
          ),
          hintText: "Enter username",
          hintStyle: GoogleFonts.sourceSansPro(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 16, 6, 102),
          ),
        ),
      ),
    );
  }
}
