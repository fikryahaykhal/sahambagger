import 'dart:ui';

import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final Widget child;

  const ListCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.23,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue.shade200.withAlpha(25),
              border: Border.all(color: Colors.white.withAlpha(25)),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
