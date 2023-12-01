import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_practice/version_1/model/webtoon_model.dart';
import 'package:http/http.dart' as http;

final pagingControllerChangeNotifierProvider =
    ChangeNotifierProvider((ref) => PagingControllerTest());

class PagingControllerTest extends ChangeNotifier {
  PagingController<int, WebtoonModel> pagingController =
      PagingController(firstPageKey: 0);

  PagingControllerTest() {
    pagingController.addPageRequestListener((pageKey) {
      _load(pageKey);
    });
  }

  _load(int pageKey) async {
    final String url =
        'https://korea-webtoon-api.herokuapp.com/?page=$pageKey&perPage=24&service=naver&updateDay=${DateFormat('EEE').format(DateTime.now()).toLowerCase()}';
    print('requestUri : $url');

    try {
      final response = await http.get(Uri.parse(url));
      print('response.statusCode : ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        var webtoons = responseBody['webtoons'];
        List<WebtoonModel> newItems = [];

        for (var webtoon in webtoons) {
          newItems.add(WebtoonModel.fromJson(webtoon));
        }

        final isLastPage = newItems.length < int.parse('24');
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          //final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems, pagingController.nextPageKey! + 1);
          print('nextPageKey : ${pagingController.nextPageKey}');
        }
      }
    } catch (e) {
      pagingController.error = e;
    } finally {
      notifyListeners();
    }
  }
}
