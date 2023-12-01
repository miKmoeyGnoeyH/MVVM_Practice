import 'package:flutter/widgets.dart';

Widget webtoonAuthor({required String author}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    child: Center(
        child: Text(
      author,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      ),
    )),
  );
}
