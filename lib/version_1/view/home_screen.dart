import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mvvm_practice/version_1/view/widgets/webtoon_grid_item.dart';
import 'package:mvvm_practice/version_1/view_model/webtoon_view_model.dart';

import '../model/webtoon_model.dart';
import '../view_model/paging_controller_test.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController =
        ref.watch(pagingControllerChangeNotifierProvider).pagingController;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: PagedGridView<int, WebtoonModel>(
          builderDelegate: PagedChildBuilderDelegate<WebtoonModel>(
            itemBuilder: (context, item, index) {
              return webtoonGridItem(webtoonModel: item);
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
          ),
          pagingController: pagingController,
        ),
      ),
    );
  }
}
