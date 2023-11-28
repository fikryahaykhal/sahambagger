import 'dart:ui';

import 'package:flutter/material.dart';

class SmallListCard extends StatelessWidget {
  final Widget child;

  const SmallListCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
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
