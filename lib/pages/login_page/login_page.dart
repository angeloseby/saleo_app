import 'dart:ui';
import 'package:saleo_app/pages/login_page/forgot_password.dart';
import 'package:saleo_app/pages/login_page/new_user_sign_up.dart';
import 'package:saleo_app/widgets/button.dart';
import 'package:saleo_app/widgets/username_field.dart';
import 'package:saleo_app/widgets/password_field.dart';
import 'package:saleo_app/widgets/window_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/bg.jpg",
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
                                    "Welcome to SaleO,",
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
                                    "Sign in to continue!",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 16, 6, 102),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Form(
                                    key: _formKey,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 100,
                                        ),
                                        UsernameField(
                                          controller: _usernameController,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        PasswordField(
                                          controller: _passwordController,
                                          hintText: "Enter password",
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const ForgotPassword(),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Button(
                                          signin: true,
                                          formKey: _formKey,
                                        ),
                                        const SizedBox(
                                          height: 60,
                                        ),
                                        const NewUserSignUp(),
                                      ],
                                    ),
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

void clearLoginFields() {
  _usernameController.clear();
  _passwordController.clear();
}

String getUsernameLogin() {
  return _usernameController.text.trim();
}

String getPasswordLogin() {
  return _passwordController.text.trim();
}
