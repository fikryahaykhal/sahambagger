import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double width;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.width,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: size.height * 0.05,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(color),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                );
              },
            ),
            side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
              return BorderSide(
                color: Colors.white,
                width: 0.2,
              );
            })),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'CM Sans Serif',
            fontSize: 15.0,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
