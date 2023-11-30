import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:main/utilities/styles.dart';

class TrasnparentButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double width;

  const TrasnparentButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.width,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextButton(
        onPressed: press,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(color: Colors.white.withAlpha(20)),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                    child: Text(
                  text,
                  style: kMediumContentStyle,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
