import 'package:flutter/material.dart';

Widget webtoonTitle({required String title}) {
  return Center(
    child: Text(
      title,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
