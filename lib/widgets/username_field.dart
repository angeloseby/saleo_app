import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TextFormField(
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
