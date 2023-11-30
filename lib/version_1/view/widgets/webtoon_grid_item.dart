import 'package:flutter/material.dart';
import 'package:mvvm_practice/version_1/model/webtoon_model.dart';
import 'package:mvvm_practice/view/widgets/webtoon_grid_item_image.dart';
import 'package:mvvm_practice/view/widgets/webtoon_grid_item_text.dart';

Widget webtoonGridItem({required WebtoonModel webtoonModel}) {
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //container를 넣은 후 색깔을 지정해주지 않으면 투명색이 됨
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: -5,
              blurRadius: 10,
            ),
          ]),
      //gridview.builder로 생성된 각각의 그리드(webtoon card)에 borderRadius를 주기 위해
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        clipBehavior: Clip.hardEdge,
        //image, text 순서로 표시
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image.network에 borderRadius를 주기 위해 container로 감쌈
            //image 영역
            webtoonGridItemImage(imgUrl: webtoonModel.img),
            //text 영역
            webtoonGridItemText(title: webtoonModel.title),
          ],
        ),
      ),
    ),
  );
}