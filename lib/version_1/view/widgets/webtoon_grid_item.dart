import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_practice/version_1/model/webtoon_model.dart';
import 'package:mvvm_practice/version_1/view/detail_screen.dart';
import 'package:mvvm_practice/version_1/view/widgets/webtoon_author.dart';
import 'package:mvvm_practice/version_1/view/widgets/webtoon_grid_item_image.dart';
import 'package:mvvm_practice/version_1/view/widgets/webtoon_grid_item_title.dart';
import 'package:mvvm_practice/version_1/view_model/detail_screen_view_model.dart';
import 'package:mvvm_practice/version_1/view_model/webtoon_episodes_view_model.dart';

Widget webtoonGridItem(BuildContext context, WidgetRef ref, {required dynamic item}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        ref.read(detailViewModelProvider.notifier).load(item);
        ref.read(webtoonEpisodeListProvider.notifier).load(item.id);
        return DetailScreen(item: item);
      }));
      // print('${item.title}, ${item.author}, ${item.id}')
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
              webtoonGridItemImage(imgUrl: item.img, id: item.id),
              webtoonGridItemTitle(title: item.title),
              webtoonAuthor(author: item.author),
            ],
          ),
        ),
      ),
    ),
  );
}
