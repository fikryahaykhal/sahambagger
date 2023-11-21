import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/components/transparent_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/screens/login_screen.dart';
import 'package:main/utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
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
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/images/bg.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.deepPurple.withOpacity(0.45),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            children: [
                              const SizedBox(
                                height: 110,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: const Text(
                                  'Welcome To',
                                  style: kTitleStyle,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: const Text(
                                  'Sahambagger App',
                                  style: kTitleBoldStyle,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          TransparentCard(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'Simplify High Return Investment',
                                  style: kSubtitleBoldStyle,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'To ensure the best experience and to give us clues how to help you, Please answer this questions!',
                                  style: kContentStyle,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TrasnparentButton(
                                  text: 'Get Started',
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  color: Colors.teal,
                                  textColor: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                const SizedBox(
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 64,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
