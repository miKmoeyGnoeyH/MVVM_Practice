import 'package:flutter/widgets.dart';

Widget webtoonGridItemText({required String title}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 10),
      child: Center(
        child: Center(
            child: Text(
              title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ),
    ),
  );
}