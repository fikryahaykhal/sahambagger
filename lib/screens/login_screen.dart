import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/bloc/auth/login/login_cubit.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/screens/register_screen.dart';
import 'package:main/utilities/styles.dart';
import 'package:main/injector.dart' as di;

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  final cubit = di.locator<LoginCubit>();

  @override
  void initState() {
    emailController.addListener(() {
      cubit.changeEmail(emailController.text.trim());
    });

    passwordController.addListener(() {
      cubit.changePassword(passwordController.text.trim());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.isInEmailValid == false) {
                Fluttertoast.showToast(msg: "Email harus diisi");
                emailNode.requestFocus();
              } else if (state.isInEmailFormat == false) {
                Fluttertoast.showToast(msg: "Email harus sesuai format");
                emailNode.requestFocus();
              } else if (state.isInPasswordValid == false) {
                Fluttertoast.showToast(msg: "Password harus diisi");
                passwordNode.requestFocus();
              } else if (state.isInError == true) {
                Fluttertoast.showToast(msg: state.errorMsg);
              } else if (state.isLoggedIn == true) {}
            },
          ),
        ],
        child: Scaffold(
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
                              userInput(
                                emailController,
                                'Email',
                                TextInputType.emailAddress,
                                false,
                                focusNode: emailNode,
                              ),
                              const SizedBox(height: 8),
                              userInput(
                                passwordController,
                                'Password',
                                TextInputType.visiblePassword,
                                true,
                                focusNode: passwordNode,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  RoundedButton(
                                      text: 'Login',
                                      press: () {
                                        cubit.sendLoginData();
                                      },
                                      color: Colors.pink.shade800,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      textColor: Colors.white),
                                  const Expanded(child: SizedBox()),
                                  RoundedButton(
                                      text: 'Login via Google',
                                      press: () {
                                        cubit.sendGoogleLogin();
                                      },
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
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
        ),
      ),
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType, bool obscure,
      {FocusNode? focusNode}) {
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
          focusNode: focusNode,
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
