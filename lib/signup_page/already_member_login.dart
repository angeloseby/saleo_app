import 'package:saleo_app/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlreadyMemberLogin extends StatefulWidget {
  const AlreadyMemberLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<AlreadyMemberLogin> createState() => _AlreadyMemberLoginState();
}

class _AlreadyMemberLoginState extends State<AlreadyMemberLogin> {
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
        print("Already have an account, SignIn ! button pressed");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ),
        );
      },
      child: Text(
        "Already have an account, SignIn ! ",
        style: GoogleFonts.sourceSansPro(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 16, 6, 102),
        ),
      ),
    );
  }
}
