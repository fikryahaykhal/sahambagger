import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/bloc/user/profile/profile_cubit.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/route/app_router.gr.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..getCurrentUser(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (_, state) {
          if (state.isInSignOut) {
            Fluttertoast.showToast(msg: 'Silahkan login kembali');
            context.router.replace(const LoginRoute());
          }
        },
        builder: (context, state) {
          final profile = state.data?.profile;
          final subs = state.data?.subs;

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
                                            MediaQuery.of(context).size.width *
                                                0.25,
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
                                                padding:
                                                    const EdgeInsets.all(6),
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
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            profile?.fullname ?? '-',
                                            style: kLargeContentStyle,
                                          ),
                                          Text(
                                            '${profile?.age} years old',
                                            style: kLargeContentStyle,
                                          ),
                                          const Text(
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
                              TransparentCard(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Status : ',
                                        style: kLargeContentStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        subs?.status ?? '-',
                                        style: kLargeContentStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Expired : ',
                                        style: kLargeContentStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        subs?.expired ?? '-',
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
                                  press: () {
                                    showSignOutConfirmation();
                                  },
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
        },
      ),
    );
  }

  void showSignOutConfirmation() {
    showDialog(
        context: context,
        builder: (dialogCtx) {
          return AlertDialog(
            title: const Text('Konfirmasin'),
            content: const Text('Anda ingin keluar?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  cubit.signOut();
                },
                child: const Text('Ya'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogCtx).pop();
                },
                child: const Text('Batal'),
              )
            ],
          );
        });
  }
}
