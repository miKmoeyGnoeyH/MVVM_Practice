import 'package:flutter/material.dart';
import 'package:mvvm_practice/version_2/view/widgets/webtoon_author.dart';
import 'package:mvvm_practice/version_2/view/widgets/webtoon_image.dart';
import 'package:mvvm_practice/version_2/view/widgets/webtoon_title.dart';

Widget webtoonGridItem({required dynamic item}) {
  print(item.runtimeType);

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          spreadRadius: -5,
          blurRadius: 10,
        ),
      ],
    ),
    clipBehavior: Clip.hardEdge,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        webtoonImage(imgUrl: item.img),
        webtoonTitle(title: item.title),
        webtoonAuthor(author: item.author),
      ],
    ),
  );
}
