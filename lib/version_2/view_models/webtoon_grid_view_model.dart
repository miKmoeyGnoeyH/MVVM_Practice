import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mvvm_practice/version_2/receivers/api_services.dart';

import '../models/webtoon_grid_model.dart';




final webtoonGridChangeNotifierProvider =
ChangeNotifierProvider((ref) => WebtoonGridViewModel());





class WebtoonGridViewModel extends ChangeNotifier {
  PagingController<int, WebtoonGridModel> pagingController =
  PagingController(firstPageKey: 0);
  ApiServices api = ApiServices();

  WebtoonGridViewModel.appendPage(List<WebtoonGridModel> newItems, int nextPageKey) {
    pagingController.appendPage(newItems, nextPageKey);
  }

  WebtoonGridViewModel.appendLastPage(List<WebtoonGridModel> newItems) {
    pagingController.appendLastPage(newItems);
  }

  WebtoonGridViewModel.onError(Object e) {
    pagingController.error = e;
  }

  WebtoonGridViewModel() {
    pagingController.addPageRequestListener((_) {
      api.getTodaysNaverWebtoons(pagingController.nextPageKey);
      notifyListeners();
    });
  }
}
