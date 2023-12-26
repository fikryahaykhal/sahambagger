import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/bloc/user/survey/survey_cubit.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/route/app_router.gr.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

List<String> _dropdownItems1 = [
  '',
  'Stockbit',
  'Instagram',
  'Youtube',
  'Tiktok',
  'Teman',
  'Google',
  'Email'
];

List<String> _dropdownItems2 = [
  '',
  'Masih awam / Baru mulai',
  'Punya sedikit knowledge namun belum terarah',
  'Sudah punya knowledge dan sedang berusaha konsisten',
  'Sudah mandiri dimana join untuk mendapatkan ide dan insight baru'
];

List<String> _dropdownItems3 = [
  '',
  'Mau belajar berfikir dan framework Momentum Investing',
  'Ingin ikut signal VIP Momentum trade (Short-Medium term)',
  'Lebih ingin mencari insight untuk Value Investing (Medium-Long term)',
  'Ingin menggunakan App (Dashboard dan Screening) untuk membantu decision making'
];

List<String> _dropdownItems4 = [
  '',
  'Konservatif - Dibawah 30% total net worth',
  'Medium - 30% - 60% total net worth',
  'Agresif - Diatas 60% total net worth'
];

List<String> _dropdownItems5 = [
  '',
  '1 - 3 Saham',
  '4 - 6 Saham',
  '6 - 10 Saham',
  '10 - 20 Saham',
  'Diatas 20 Saham'
];

List<String> _dropdownItems6 = [
  '',
  'Dibawah 10 Juta',
  '10-50 Juta',
  '50-100 Juta',
  '100-500 Juta',
  '500 Juta - 1 Milyar',
  '1 - 5 Milyar',
  '5 - 15 Milyar',
  'Diatas 15 Milyar'
];

class _SurveyScreenState extends State<SurveyScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  final cubit = SurveyCubit();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPageIndex < 1) {
      setState(() {
        _currentPageIndex++;
        _pageController.animateToPage(_currentPageIndex,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      setState(() {
        _currentPageIndex--;
        _pageController.animateToPage(_currentPageIndex,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<SurveyCubit, SurveyState>(
        listener: (context, state) {
          if (state.isInSubmitSuccess) {
            context.router.replace(const DashboardRoute());
          }

          if (state.isInError) {
            Fluttertoast.showToast(msg: state.errorMsg);
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fill the forms',
                              style: kTitleBoldStyle,
                            ),
                            Text(
                              'to help us know your preferences',
                              style: kMediumContentStyle,
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
                            height: MediaQuery.of(context).size.height * 0.53,
                            child: PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return TransparentCard(
                                  child: index == 0
                                      ? _buildFirstPageContent()
                                      : _buildSecondPageContent(),
                                );
                              },
                            ),
                          )
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
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Darimana Anda Mengenal Sahambagger?',
                style: kMediumContentStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dropdownInput(
              state.source,
              _dropdownItems1,
              (String? newValue) {
                cubit.setSource(newValue);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Mana yang paling menggambarkan kemampuan Investasi Anda saat ini?',
                style: kMediumContentStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dropdownInput(
              state.ability,
              _dropdownItems2,
              (String? value) {
                cubit.setAbility(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Apa yang Anda cari di Sahambagger?',
                style: kMediumContentStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dropdownInput(
              state.needs,
              _dropdownItems3,
              (String? value) {
                cubit.setNeeds(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            RoundedButton(
                text: 'Next',
                press: state.isInToSecondForm
                    ? () {
                        _pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 1),
                            curve: Curves.linear);
                      }
                    : () {},
                color: state.isInToSecondForm ? Colors.blue : Colors.grey,
                width: 0,
                textColor: Colors.white)
          ],
        );
      },
    );
  }

  Widget _buildSecondPageContent() {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Seberapa tinggi tingkat resiko Investasi saham Anda?',
                style: kMediumContentStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dropdownInput(
              state.risk,
              _dropdownItems4,
              (String? value) {
                cubit.setRisk(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Berapa jumlah saham preferensi Anda dalam 1 portofolio saat ini?',
                style: kMediumContentStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dropdownInput(
              state.sahamPrefs,
              _dropdownItems5,
              (String? value) {
                cubit.setSahamPrefs(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Berapa besar nilai portofolio saham Anda?',
                style: kMediumContentStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dropdownInput(
              state.portofolio,
              _dropdownItems6,
              (String? value) {
                cubit.setPortofolio(value);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            RoundedButton(
              text: 'Submit',
              press: state.isInToSubmit
                  ? () {
                      cubit.submit();
                    }
                  : () {},
              color: state.isInToSubmit ? Colors.blue : Colors.grey,
              width: 0,
              textColor: Colors.white,
            )
          ],
        );
      },
    );
  }

  Widget dropdownInput(
    String selectedItem,
    List<String> dropdownItems,
    void Function(String?) onChanged,
  ) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedItem,
            items: dropdownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: kMediumContentStyle,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            style: kMediumContentStyle.copyWith(color: Colors.white),
            dropdownColor: Colors.deepPurple.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
