import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  DescriptionText(
      {super.key, this.size = 19, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
