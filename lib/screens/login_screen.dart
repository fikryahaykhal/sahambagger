import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/screens/home_screen.dart';
import 'package:main/screens/register_screen.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: -0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Transform.flip(
                  flipX: true,
                  child: Image.asset(
                    'assets/images/bg.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(
                      child: TransparentCard(
                          child: Column(
                        children: [
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
                                  press: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  },
                                  color: Colors.pink.shade800,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  textColor: Colors.white),
                              const Expanded(child: SizedBox()),
                              RoundedButton(
                                  text: 'Login via Google',
                                  press: () {},
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  textColor: Colors.pink.shade800),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Not a VIP User? ',
                                    style: kMediumContentStyle),
                                TextSpan(
                                    text: 'Sign Up Here',
                                    style: const TextStyle(
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
                                                    const RegisterScreen()));
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
                                    style: const TextStyle(
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
                    ),
                  )
                ],
              ),
            ),
          ],
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
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          style: kMediumContentStyle,
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          obscureText: obscure,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: kMediumContentStyle,
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
