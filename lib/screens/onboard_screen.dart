import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main/components/transparent_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/data/services/prefs/preferences.dart';
import 'package:main/screens/login_screen.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TransparentCard(
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
                              style: kMediumContentStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TrasnparentButton(
                              text: 'Get Started',
                              press: () {
                                Prefs.setWasStarted(true);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              color: Colors.teal,
                              textColor: Colors.white,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ),
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
      ),
    );
  }
}
