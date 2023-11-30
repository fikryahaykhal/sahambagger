import 'dart:ui';

import 'package:flutter/material.dart';

class TransparentCard extends StatelessWidget {
  final Widget child;

  const TransparentCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(15),
            border: Border.all(color: Colors.white.withAlpha(10)),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: child,
        ),
      ),
    );
  }
}
