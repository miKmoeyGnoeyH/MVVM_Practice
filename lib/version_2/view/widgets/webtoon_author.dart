import 'package:flutter/material.dart';

Widget webtoonAuthor({required String author}) {
  return Center(
    child: Text(
      author,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
