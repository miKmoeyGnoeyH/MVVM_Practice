import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mvvm_practice/version_2/view/widgets/webtoon_grid_item.dart';

import '../view_models/webtoon_grid_view_model.dart';

class WebtoonGridView extends ConsumerWidget {
  const WebtoonGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController =
        ref.watch(webtoonGridChangeNotifierProvider).pagingController;

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: PagedGridView(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) {
              return webtoonGridItem(item: item);
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 2,
          ),
        ),
      ),
    );
  }
}
