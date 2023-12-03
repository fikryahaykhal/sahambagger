import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();

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
                    'assets/images/bg_regis.jpg',
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
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Let me help you',
                          style: kTitleBoldStyle,
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
                      child: Column(
                        children: [
                          TransparentCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                userInput(nameController, 'Full Name',
                                    TextInputType.text, false, 35),
                                const SizedBox(height: 8),
                                userInput(ageController, 'Age',
                                    TextInputType.number, false, 3),
                                const SizedBox(
                                  height: 8,
                                ),
                                userInput(hpController, 'Phone Number',
                                    TextInputType.phone, false, 14),
                                const SizedBox(height: 8),
                                userInput(emailController, 'Email',
                                    TextInputType.emailAddress, false, 30),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: const Text(
                                    'Dari mana Anda mengenal Sahambagger?',
                                    style: kMediumContentStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
      TextInputType keyboardType, bool obscure, int limit) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextFormField(
          style: kMediumContentStyle,
          controller: userInput,
          inputFormatters: [LengthLimitingTextInputFormatter(limit)],
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
