import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key, required this.titleText, this.fontSize = 26});

  final String titleText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Text(
        titleText,
        style: TextStyle(fontSize: fontSize),
      ),
      centerTitle: true,
    );
  }
}
