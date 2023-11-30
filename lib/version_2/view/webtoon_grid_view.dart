import 'package:flutter/material.dart';
import 'package:mvvm_practice/version_2/view/app_bar.dart';

class WebtoonGridView extends StatelessWidget {
  const WebtoonGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'MVVM',
          style: TextStyle(
            fontSize: 26,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: WebtoonGrid(),
      ),
    );
  }
}
