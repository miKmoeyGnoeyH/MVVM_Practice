import 'package:flutter/material.dart';

Widget webtoonGridItemTitle({required String title}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
      )),
    ),
  );
}
