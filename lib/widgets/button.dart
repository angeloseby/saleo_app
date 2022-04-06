import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saleo_app/pages/login_page/login_page.dart';
import 'package:saleo_app/widgets/custom_alert_dialog.dart';
import '../pages/signup_page/signup_page.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.signin, required this.formKey})
      : super(key: key);
  final bool signin;
  final GlobalKey<FormState> formKey;
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
        widget.signin ? _validateSignIn() : _validateSignUp();
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

  _validateSignUp() {
    String username = getUsernameSignUp();
    String password = getPasswordSignUp();
    String repassword = getRepasswordSignUp();
    if (widget.formKey.currentState!.validate()) {
      if (repassword == password) {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
              width: 300,
              height: 300,
              backgroundColor: Colors.green,
              text: "User Created Succesfully",
              textSize: 30),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
              width: 300,
              height: 300,
              backgroundColor: Colors.red,
              text: "Passwords doesn't match",
              textSize: 30),
        );
      }
      print("username : $username\npassword : $password");
    }
  }

  _validateSignIn() {
    print("Sign in clicked");
    String username = getUsernameLogin();
    String password = getPasswordLogin();
    if (widget.formKey.currentState!.validate()) {
      if (username == password) {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
              width: 300,
              height: 300,
              backgroundColor: Colors.green,
              text: "Sign In Success",
              textSize: 30),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
              width: 300,
              height: 300,
              backgroundColor: Colors.red,
              text: "ERROR !",
              textSize: 30),
        );
      }
      print("Sign in clicked + $username+:::::+$password");
    }
  }
}
