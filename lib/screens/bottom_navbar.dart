import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/bloc/navbar/bottom_navigation_cubit.dart';
import 'package:main/route/app_router.gr.dart';

@RoutePage()
class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  final _bottomNavigationCubit = BottomNavigationCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bottomNavigationCubit,
        child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            builder: (_, state) {
          final selectedIndex =
              state.maybeWhen(changedIndex: (value) => value, orElse: () => 0);
          return AutoTabsScaffold(
            routes: const [
              HomeRoute(),
              TablesRoute(),
              DashboardRoute(),
              LearningRoute(),
              ProfileRoute()
            ],
            animationDuration: const Duration(),
            bottomNavigationBuilder: (_, router) {
              return Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height *
                    (Platform.isIOS ? 0.12 : 0.078),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, -2)),
                  ],
                ),
                child: BottomNavigationBar(
                  selectedFontSize: 12,
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.white,
                  elevation: 0,
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    router.setActiveIndex(index);
                    _bottomNavigationCubit.changeIndex(index);
                  },
                  unselectedItemColor: Colors.black,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      backgroundColor: Colors.white,
                      icon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      activeIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      activeIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      label: 'Screener',
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              "assets/images/edit.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                      activeIcon: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              "assets/images/edit.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      icon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      label: 'Learning',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      icon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              );
            },
          );
        }));
  }

  void onTap(index) {
    switch (index) {
      case 0:
        context.router.navigate(const HomeRoute());
        break;
      case 1:
        context.router.navigate(const TablesRoute());
        break;
      case 2:
        context.router.navigate(const DashboardRoute());
        break;
      case 3:
        context.router.navigate(const LearningRoute());
        break;
      default:
        context.router.navigate(const ProfileRoute());
    }

    _bottomNavigationCubit.changeIndex(index);
  }
}
