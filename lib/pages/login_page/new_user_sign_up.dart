import 'package:saleo_app/pages/login_page/login_page.dart';
import 'package:saleo_app/pages/signup_page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewUserSignUp extends StatefulWidget {
  const NewUserSignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<NewUserSignUp> createState() => _NewUserSignUpState();
}

class _NewUserSignUpState extends State<NewUserSignUp> {
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
        print("I'm a new user, Sign Up Clicked");
        clearLoginFields();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const SignUpPage();
            },
          ),
        );
      },
      child: Text(
        "I'm a new user, Sign Up ",
        style: GoogleFonts.sourceSansPro(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 16, 6, 102),
        ),
      ),
    );
  }
}
