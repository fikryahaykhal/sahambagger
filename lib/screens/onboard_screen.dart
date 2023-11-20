import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/components/rounded_button.dart';
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
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
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
                            'Sahambagger',
                            style: kTitleBoldStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Image.asset(
                      'assets/images/onboard.png',
                      height: 280,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(15),
                              border:
                                  Border.all(color: Colors.white.withAlpha(10)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Simplify High Return Investment',
                                  style: kSubtitleStyle,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                RoundedButton(
                                  text: 'Get Started',
                                  press: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                        (route) => false);
                                  },
                                  color: Colors.teal,
                                  textColor: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                                const SizedBox(
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
