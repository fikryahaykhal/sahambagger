import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

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

String _selectedItem3 = 'Masih Awam / Baru Mulai';
List<String> _dropdownItems3 = ['Masih Awam / Baru Mulai', 'Sudah Mandiri'];

String _selectedItem4 = 'Masih Awam / Baru Mulai';
List<String> _dropdownItems4 = ['Masih Awam / Baru Mulai', 'Sudah Mandiri'];

String _selectedItem5 = 'Masih Awam / Baru Mulai';
List<String> _dropdownItems5 = ['Masih Awam / Baru Mulai', 'Sudah Mandiri'];

String _selectedItem6 = 'Masih Awam / Baru Mulai';
List<String> _dropdownItems6 = ['Masih Awam / Baru Mulai', 'Sudah Mandiri'];

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();

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
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                      ],
                    ),
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
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      const SizedBox(height: 16),
      userInput(nameController, 'Full Name', TextInputType.text, false, 35),
      const SizedBox(height: 8),
      userInput(ageController, 'Age', TextInputType.number, false, 3),
      const SizedBox(
        height: 8,
      ),
      userInput(hpController, 'Phone Number', TextInputType.phone, false, 14),
      const SizedBox(height: 8),
      userInput(
          emailController, 'Email', TextInputType.emailAddress, false, 30),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: const Text(
          'Dari mana Anda mengenal Sahambagger?',
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
      const Expanded(child: SizedBox()),
      Padding(
        padding: EdgeInsets.only(right: 24),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Next',
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
                      _nextPage();
                    })
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      )
    ]);
  }

  Widget _buildSecondPageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        const SizedBox(
          height: 8,
        ),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Previous',
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
                            _previousPage();
                          })
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Next',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontFamily: 'CM Sans Serif',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          height: 1.2,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType, bool obscure, int limit) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextFormField(
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
