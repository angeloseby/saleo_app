import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  double fontSize = 18;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          fontSize = 18.5;
        });
      },
      onTapUp: (details) {
        setState(() {
          fontSize = 18;
        });
      },
      onTap: () {
        print("Forgot Password clicked ");
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.sourceSansPro(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 16, 6, 102),
            ),
          ),
        ),
      ),
    );
  }
}
