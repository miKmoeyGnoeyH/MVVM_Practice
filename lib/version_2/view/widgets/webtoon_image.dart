import 'package:flutter/material.dart';

Widget webtoonImage({required String imgUrl}) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(imgUrl));
}
