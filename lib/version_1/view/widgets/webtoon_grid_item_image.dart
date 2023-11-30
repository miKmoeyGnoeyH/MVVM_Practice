import 'package:flutter/widgets.dart';

Widget webtoonGridItemImage({required String imgUrl, double verticalPadding = 4, double horizontalPadding = 4}) {
  return Padding(
    padding: EdgeInsets.only(left: verticalPadding, right: verticalPadding, top: horizontalPadding),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          imgUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
  );
}