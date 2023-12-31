import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:main/components/rounded_button.dart';
import 'package:main/components/transparent_button.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

final PageController _pageController = PageController(initialPage: 0);

String _selectedItem1 = 'Stockbit';
List<String> _dropdownItems1 = [
  'Stockbit',
  'Instagram',
  'Youtube',
  'Tiktok',
  'Teman',
  'Google',
  'Email'
];

String _selectedItem2 = 'Masih Awam / Baru Mulai';
List<String> _dropdownItems2 = ['Masih Awam / Baru Mulai', 'Sudah Mandiri'];

String _selectedItem3 = 'Belajar tentang Framework Momentum Investing';
List<String> _dropdownItems3 = [
  'Belajar tentang Framework Momentum Investing',
  'Mengikuti signal VIP Momentum trade (Short-Medium term)',
  'Mencari insight untuk Value Investing (Medium-Long term)',
  'menggunakan App (Dashboard dan Screening) untuk membantu decision making'
];

String _selectedItem4 = 'Konservatif - Dibawah 30% total net worth';
List<String> _dropdownItems4 = [
  'Konservatif - Dibawah 30% total net worth',
  'Medium - 30% - 60% total net worth',
  'Agresif - Diatas 60% total net worth'
];

String _selectedItem5 = '1 - 3 Saham';
List<String> _dropdownItems5 = [
  '1 - 3 Saham',
  'S 4 - 6 Saham',
  '6 - 10 Saham',
  '10 - 20 Saham',
  'Diatas 20 Saham'
];

String _selectedItem6 = 'Dibawah 10 Juta';
List<String> _dropdownItems6 = [
  'Dibawah 10 Juta',
  '10-50 Juta',
  '50-100 Juta',
  '100-500 Juta',
  '500 Juta - 1 Milyar',
  ' 1 - 5 Milyar',
  '5 - 15 Milyar',
  'Diatas 15 Milyar'
];

class _SurveyScreenState extends State<SurveyScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

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
                        height: MediaQuery.of(context).size.height * 0.51,
                        child: PageView.builder(
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
    );
  }

  Widget _buildFirstPageContent() {
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
          _selectedItem1,
          _dropdownItems1,
          (String? newValue) {
            setState(() {
              if (newValue != null) {
                _selectedItem1 = newValue;
              }
            });
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
          _selectedItem2,
          _dropdownItems2,
          (String? newValue) {
            setState(() {
              if (newValue != null) {
                _selectedItem2 = newValue;
              }
            });
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
          _selectedItem3,
          _dropdownItems3,
          (String? newValue) {
            setState(() {
              if (newValue != null) {
                _selectedItem3 = newValue;
              }
            });
          },
        ),
        const Expanded(child: SizedBox()),
        RoundedButton(
          text: 'Next',
          press: () {},
          width: 0,
          textColor: Colors.white,
          colorStart: Colors.deepPurple.shade900,
          colorEnd: Colors.purpleAccent.shade400,
        )
      ],
    );
  }

  Widget _buildSecondPageContent() {
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
          _selectedItem4,
          _dropdownItems4,
          (String? newValue) {
            setState(() {
              if (newValue != null) {
                _selectedItem4 = newValue;
              }
            });
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
          _selectedItem5,
          _dropdownItems5,
          (String? newValue) {
            setState(() {
              if (newValue != null) {
                _selectedItem5 = newValue;
              }
            });
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
          _selectedItem6,
          _dropdownItems6,
          (String? newValue) {
            setState(() {
              if (newValue != null) {
                _selectedItem6 = newValue;
              }
            });
          },
        ),
        const Expanded(child: SizedBox()),
        RoundedButton(
          text: 'Submit',
          press: () {},
          width: 0,
          textColor: Colors.white,
          colorStart: Colors.deepPurple.shade900,
          colorEnd: Colors.purpleAccent.shade400,
        )
      ],
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
