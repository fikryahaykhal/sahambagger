import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/screens/register_screen.dart';
import 'package:main/utilities/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: -75,
                      top: -10,
                      child: Image.asset(
                        'assets/images/password.png',
                        opacity: const AlwaysStoppedAnimation(.1),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 180,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome,',
                              style: kTitleBoldStyle,
                            ),
                            Text(
                              'Sign in to continue',
                              style: kSubtitleStyle,
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                            child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(15),
                                      border: Border.all(
                                          color: Colors.white.withAlpha(10)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                    ),
                                    child: Column(children: [
                                      const SizedBox(height: 16),
                                      userInput(emailController, 'Email',
                                          TextInputType.emailAddress, false),
                                      const SizedBox(height: 8),
                                      userInput(passwordController, 'Password',
                                          TextInputType.visiblePassword, true),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          RoundedButton(
                                              text: 'Login',
                                              press: () {},
                                              color: Colors.teal,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              textColor: Colors.white),
                                          const Expanded(child: SizedBox()),
                                          RoundedButton(
                                              text: 'Login via Google',
                                              press: () {},
                                              color: Colors.white,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              textColor: Colors.red.shade900),
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Not a VIP User? ',
                                      style: kContentStyle),
                                  TextSpan(
                                      text: 'Sign Up Here',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontFamily: 'CM Sans Serif',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                        height: 1.2,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      RegisterScreen()));
                                        })
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontFamily: 'CM Sans Serif',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                        height: 1.2,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {})
                                ],
                              ),
                            )
                          ],
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType, bool obscure) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          style: kContentStyle,
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          obscureText: obscure,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: kContentStyle,
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
