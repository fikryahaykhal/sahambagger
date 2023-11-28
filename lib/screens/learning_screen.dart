import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/utilities/styles.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF660958),
              Color(0xFF34042D),
              Color(0xFF240430),
              Color(0xFF15041c),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Center(
                  child: Text(
                    'Learning Zone',
                    style: kTitleBoldStyle,
                  ),
                ),
              ),
              TabBar(
                labelColor: Colors.black,
                tabs: [
                  TransparentCard(child: Text('')),
                  Tab(text: "Tab1"),
                ],
                controller: tabController,
              )
            ]),
      )
    ])));
  }
}
