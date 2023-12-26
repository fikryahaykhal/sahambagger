import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/bloc/auth/register/register_cubit.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/route/app_router.gr.dart';
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
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final passController = TextEditingController();

  final nameNode = FocusNode();
  final ageNode = FocusNode();
  final userNode = FocusNode();
  final emailNode = FocusNode();
  final hpNode = FocusNode();
  final passNode = FocusNode();

  final cubit = RegisterCubit();

  @override
  void initState() {
    nameController.addListener(() {
      cubit.setName(nameController.text);
    });

    ageController.addListener(() {
      try {
        cubit.setAge(int.tryParse(ageController.text));
      } catch (e) {
        debugPrint('Age text not int handling');
      }
    });

    userController.addListener(() {
      cubit.setUsername(userController.text);
    });

    emailController.addListener(() {
      cubit.setEmail(emailController.text);
    });

    hpController.addListener(() {
      cubit.setPhoneNumber(hpController.text);
    });

    passController.addListener(() {
      cubit.setPassword(passController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.isInNameInvalidate) {
            Fluttertoast.showToast(msg: 'Fullname harus diisi');
            nameNode.requestFocus();
          }

          if (state.isInAgeInvalidate) {
            Fluttertoast.showToast(msg: 'Age harus diisi');
            ageNode.requestFocus();
          }

          if (state.isInPhoneInvalidate) {
            Fluttertoast.showToast(msg: 'Phone Number harus diisi');
            hpNode.requestFocus();
          }

          if (state.isInUsernameInvalidate) {
            Fluttertoast.showToast(msg: 'Username harus diisi');
            userNode.requestFocus();
          }

          if (state.isInEmailInvalidate) {
            Fluttertoast.showToast(msg: 'Email harus diisi');
            emailNode.requestFocus();
          }

          if (state.isInEmailFormatInvalidate) {
            Fluttertoast.showToast(msg: 'Format email tidak sesuai');
            emailNode.requestFocus();
          }

          if (state.isInPasswordInvalidate) {
            Fluttertoast.showToast(msg: 'Password harus diisi');
            passNode.requestFocus();
          }

          if (state.isInError) {
            Fluttertoast.showToast(msg: state.errorMsg);
          }

          if (state.isInSignUpSuccess) {
            context.router.replace(const SurveyRoute());
          }
        },
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
                        'assets/images/bg_regis.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                        child: Column(children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: TransparentCard(
                                  child: _buildFirstPageContent()))
                        ]),
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

  Widget _buildFirstPageContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      const SizedBox(height: 16),
      userInput(nameController, 'Full Name', TextInputType.text, false, 35,
          node: nameNode),
      const SizedBox(height: 8),
      userInput(ageController, 'Age', TextInputType.number, false, 3,
          node: ageNode),
      const SizedBox(
        height: 8,
      ),
      userInput(hpController, 'Phone Number', TextInputType.phone, false, 14,
          node: hpNode),
      const SizedBox(height: 8),
      userInput(
          userController, 'Username', TextInputType.emailAddress, false, 30,
          node: userNode),
      const Expanded(child: SizedBox()),
      userInput(emailController, 'Email', TextInputType.emailAddress, false, 30,
          node: emailNode),
      const Expanded(child: SizedBox()),
      userInput(passController, 'Password', TextInputType.text, true, 30,
          node: passNode),
      const Expanded(child: SizedBox()),
      Center(
          child: RoundedButton(
              text: 'Submit',
              press: () {
                cubit.doSignUp();
              },
              color: Colors.blue.withAlpha(70),
              width: MediaQuery.of(context).size.width,
              textColor: Colors.white))
    ]);
  }

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType, bool obscure, int limit,
      {FocusNode? node}) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextFormField(
          focusNode: node,
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
