import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

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
        const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(
                              'Sahambagger Screener',
                              style: kTitleBoldStyle,
                            ),
                          ),
                        ),
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
