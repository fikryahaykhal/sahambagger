import 'package:auto_route/auto_route.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/bloc/learning/learning_cubit.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';
import 'package:main/presenter/uikit/cards/content_card.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  final cubit = LearningCubit();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit
        ..getInsight()
        ..getELearning(),
      child: BlocListener<LearningCubit, LearningState>(
        listener: (context, state) {
          if (state.isInError) {
            Fluttertoast.showToast(msg: state.errorMsg);
          }
        },
        child: Scaffold(
          body: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    color: const Color(0xFF000033),
                    height: 100,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFF000033),
                      child: const Column(
                        children: [
                          Text('Learning Zone', style: kTitleBoldStyle),
                          SizedBox(
                            height: 32,
                          )
                        ],
                      )),
                  Container(
                    color: const Color(0xFF000033),
                    child: ExtendedTabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        color: Colors.white.withAlpha(15),
                        border: Border.all(color: Colors.white.withAlpha(10)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      scrollDirection: Axis.horizontal,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(15),
                                    border: Border.all(
                                        color: Colors.white.withAlpha(10)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                  ),
                                  child: const ExtendedTab(
                                    text: 'Insight',
                                    scrollDirection: Axis.vertical,
                                  ),
                                ))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(15),
                                border: Border.all(
                                    color: Colors.white.withAlpha(10)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                              ),
                              child: const ExtendedTab(
                                text: 'E-Learning',
                                scrollDirection: Axis.vertical,
                              ),
                            ),
                          ),
                        ),
                      ],
                      controller: tabController,
                    ),
                  ),
                  Container(
                    color: const Color(0xFF000033),
                    height: 16,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        InsightTab(),
                        ELearningTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InsightTab extends StatelessWidget {
  const InsightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningCubit, LearningState>(
      builder: (context, state) {
        final isInProgress = state.isInInsightProgress;
        final list = state.insightList;
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF000033), // Darker Navy
                Color(0xFF1A5276), // Darker RoyalBlue
                Color(0xFF1D5F7A), // Even darker version of RoyalBlue
                Color(0xFF1F618D),
              ],
            ),
          ),
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: list != null
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width * 0.5,
                    ),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = list[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: UiKitItemContent(data: data),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}

class ELearningTab extends StatelessWidget {
  const ELearningTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF000033), // Darker Navy
              Color(0xFF1A5276), // Darker RoyalBlue
              Color(0xFF1D5F7A), // Even darker version of RoyalBlue
              Color(0xFF1F618D),
            ],
          ),
        ),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.3),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: TransparentCard(child: Text('')),
              );
            },
          ),
        ));
  }
}
