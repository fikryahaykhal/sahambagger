import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main/utilities/styles.dart';

@RoutePage()
class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

TextEditingController _controller = TextEditingController();

@override
void dispose() {
  _controller.dispose();
}

class _TablesScreenState extends State<TablesScreen> {
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
                          child: Center(
                            child: Text(
                              'Sahambagger Screener',
                              style: kTitleBoldStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: TextField(
                                controller: _controller,
                                decoration: const InputDecoration(
                                  hintText: 'Nama Saham',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  suffixIcon:
                                      Icon(Icons.search, color: Colors.white70),
                                  border: InputBorder.none, // Remove the border
                                ),
                                style: const TextStyle(color: Colors.white),
                                onChanged: (value) {
                                  print('Search query: $value');
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: SingleChildScrollView(
                                child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.white.withAlpha(50)),
                                  columnSpacing: 58,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                        label: Text(
                                      'Nama',
                                      style: kLargeContentStyle,
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'AB',
                                      style: kLargeContentStyle,
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'CD',
                                      style: kLargeContentStyle,
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'EF',
                                      style: kLargeContentStyle,
                                    )),
                                  ],
                                  rows: const <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                      DataCell(Text(' ')),
                                    ]),
                                  ],
                                ),
                              ),
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
