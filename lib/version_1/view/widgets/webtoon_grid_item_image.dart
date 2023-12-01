import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget webtoonGridItemImage(
    {required String imgUrl,
    required int id,
    double verticalPadding = 4,
    double horizontalPadding = 4}) {
  return Padding(
    padding: EdgeInsets.only(
        left: verticalPadding, right: verticalPadding, top: horizontalPadding),
    child: Hero(
      tag: id,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          fit: BoxFit.fitWidth,
          placeholder: (context, imgUrl) => Container(
            height: 146,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    ),
  );
}
