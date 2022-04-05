import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saleo_app/pages/login_page/login_page.dart';
import '../pages/signup_page/signup_page.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.signin}) : super(key: key);
  final bool signin;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color buttonColor = Colors.white.withOpacity(0.3);
  double width = 250;
  double height = 50;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          buttonColor = Colors.white.withOpacity(0.5);
          width = 255;
          height = 55;
        });
      },
      onTapUp: (details) {
        setState(() {
          buttonColor = Colors.white.withOpacity(0.3);
          width = 250;
          height = 50;
        });
      },
      onTap: () {
        widget.signin ? _signIn() : _signUp();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 24,
                spreadRadius: 16,
                color: Colors.white.withOpacity(0.2))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              child: Center(
                child: Text(
                  widget.signin ? "Sign in" : "Sign up",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 16, 6, 102),
                  ),
                ),
              ),
              width: 250,
              height: 50,
              decoration: BoxDecoration(color: buttonColor),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() {
    String username = getUsernameSignUp();
    String password = getPasswordSignUp();
    print("Sign up clicked + $username+:::::+$password");
  }

  void _signIn() {
    print("Sign in clicked");
    String username = getUsernameLogin();
    String password = getPasswordLogin();
    print("Sign in clicked + $username+:::::+$password");
  }
}
