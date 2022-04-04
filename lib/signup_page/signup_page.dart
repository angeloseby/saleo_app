import 'dart:ui';
import 'package:saleo_app/signup_page/already_member_login.dart';
import 'package:saleo_app/widgets/button.dart';
import 'package:saleo_app/widgets/mail_id_field.dart';
import 'package:saleo_app/widgets/password_field.dart';
import 'package:saleo_app/window_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final TextEditingController passController = TextEditingController();
  final TextEditingController repassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/bg1.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            const AppTitleBar(),
            Center(
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 24,
                              spreadRadius: 16,
                              color: Colors.black.withOpacity(0.2)),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            height: MediaQuery.of(context).size.height * .8,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 15,
                                  left: 30,
                                  child: Text(
                                    "Welcome,",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromARGB(255, 16, 6, 102),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 70,
                                  left: 35,
                                  child: Text(
                                    "Sign up now !",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 16, 6, 102),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      const MailIDField(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      PasswordField(
                                        hintText: "Enter a new password",
                                        passController: passController,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      PasswordField(
                                        hintText: "ReEnter new password",
                                        passController: repassController,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const Button(
                                        buttonText: "Sign up",
                                      ),
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      const AlreadyMemberLogin(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].reversed.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
