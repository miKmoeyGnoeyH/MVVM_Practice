import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_practice/model/webtoon_model.dart';
import 'package:mvvm_practice/view_model/webtoon_view_model.dart';

part './widgets/webtoon_grid_item.dart';
part './widgets/webtoon_grid_item_image.dart';
part './widgets/webtoon_grid_item_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webtoons =
        ref.watch(webtoonModelChangeNotifierProvider).webtoonModelList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'MVVM',
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.6,
            ),
            itemCount: webtoons.length,
            itemBuilder: (BuildContext context, int index) {
              var webtoon = webtoons[index];

              return WebtoonGridItem(webtoon: webtoon);
            },
          ),
        ),
      ),
    );
  }
}