import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_practice/version_1/view_model/paging_controller_test.dart';
import 'package:mvvm_practice/version_2/models/webtoon_grid_model.dart';
import 'package:mvvm_practice/version_2/view_models/webtoon_grid_view_model.dart';

class ApiServices {
  Future<void> getTodaysNaverWebtoons(int? page) async {
    const String scheme = 'https';
    const String host = 'korea-webtoon-api.herokuapp.com';
    const String perPage = '24';
    const String service = 'naver';

    final String url =
        'https://korea-webtoon-api.herokuapp.com/?page=$page&perPage=24&service=naver&updateDay=${DateFormat('EEE').format(DateTime.now()).toLowerCase}';

    try {
      final Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        var todaysNaverWebtoons = responseBody['webtoons'];
        List<WebtoonGridModel> newItems = [];

        for (var webtoon in todaysNaverWebtoons) {
          newItems.add(WebtoonGridModel.fromJson(webtoon));
        }

        final isLastPage = newItems.length < int.parse(perPage);

        if (isLastPage) {
          WebtoonGridViewModel.appendLastPage(newItems);
        } else {
          WebtoonGridViewModel.appendPage(newItems, page! + 1);
        }
      }
    } catch (e) {
      WebtoonGridViewModel.onError(e);
    }
  }

  Future<Response> nomad({required String id, bool episodes = false}) async {
    final Uri requestUri = Uri(
      scheme: 'https',
      host: 'webtoon-crawler.nomadcoders.workers.dev',
      path: ':$id${episodes ? '/episodes' : ''}',
    );

    return await get(requestUri);
  }
}
