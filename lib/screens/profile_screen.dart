import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF06061A),
                Color(0xFF1A0A42),
                Color(0xFF180048),
                Color(0xFF180048),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Profile',
                            style: kTitleBoldStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TransparentCard(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withAlpha(15),
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          'assets/images/avatar.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 75,
                                        right: 1,
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                              'assets/images/edit.png'),
                                        ),
                                      ),
                                    ],
                                  )),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'User 001',
                                      style: kLargeContentStyle,
                                    ),
                                    Text(
                                      '24 years old',
                                      style: kLargeContentStyle,
                                    ),
                                    Text(
                                      '+62-823-4567-8910 ',
                                      style: kLargeContentStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const TransparentCard(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Status : ',
                                  style: kLargeContentStyle,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'VIP',
                                  style: kLargeContentStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Expired : ',
                                  style: kLargeContentStyle,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '27/05/2027',
                                  style: kLargeContentStyle,
                                ),
                              ],
                            ),
                          ],
                        )),
                        const SizedBox(
                          height: 32,
                        ),
                        RoundedButton(
                            text: 'Logout',
                            press: () {},
                            colorStart: Colors.deepPurple.shade900,
                            colorEnd: Colors.purpleAccent.shade400,
                            width: MediaQuery.of(context).size.width,
                            textColor: Colors.white)
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
