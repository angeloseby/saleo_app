import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {Key? key, required this.hintText, required this.passController})
      : super(key: key);

  final String hintText;
  final TextEditingController passController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TextFormField(
        controller: widget.passController,
        obscureText: isObscure,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
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
            Icons.lock,
            color: Color.fromARGB(255, 16, 6, 102),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.sourceSansPro(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 16, 6, 102),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: const Color.fromARGB(255, 16, 6, 102),
            ),
          ),
        ),
      ),
    );
  }
}
