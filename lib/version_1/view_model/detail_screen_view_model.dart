import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_practice/version_1/model/webtoon_detail_model.dart';
import 'package:mvvm_practice/version_1/model/webtoon_model.dart';
import 'package:http/http.dart' as http;

final detailViewModelProvider =
    ChangeNotifierProvider((_) => DetailViewModel());

//final EpisodeListProvider = ;

class DetailViewModel extends ChangeNotifier {
  late WebtoonDetailModel? webtoonDetailModel;

  DetailViewModel() {
    webtoonDetailModel = null;
  }

  load(WebtoonModel item) async {
    webtoonDetailModel = null;

    const String url =
        //'https://webtoon-crawler.nomadcoders.workers.dev/${item.id}';
        'http://192.168.1.42:8080/postlist';
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
      print(response);

      if (response.statusCode == 200) {
        final webtoonDetails = jsonDecode(response.body);
        webtoonDetailModel = WebtoonDetailModel.fronJson(webtoonDetails, item);
        print(webtoonDetailModel);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    } finally {
      print(webtoonDetailModel);
      notifyListeners();
    }
  }
}
