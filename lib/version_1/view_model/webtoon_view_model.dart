import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_practice/version_1/model/webtoon_model.dart';
import 'package:http/http.dart' as http;

final webtoonModelChangeNotifierProvider =
    ChangeNotifierProvider((ref) => WebtoonModelChangeNotifierProvider());

class WebtoonModelChangeNotifierProvider extends ChangeNotifier {
  late List<WebtoonModel> webtoonModelList = [];
  late Uri _requestUri;

  //Command _httpRequestCommand;

  WebtoonModelChangeNotifierProvider() {
    const String service = 'naver';
    final String updateDay =
        DateFormat('EEE').format(DateTime.now()).toLowerCase();

    final queryParameters = {
      'perPage': '24',
      'service': service,
      'updateDay': updateDay
    };

    _requestUri = Uri(
        scheme: 'https',
        host: 'korea-webtoon-api.herokuapp.com',
        queryParameters: queryParameters);

    _load();
  }

  _load() async {
    try {
      final response = await http.get(_requestUri);
      //print('statusCode : ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        var webtoons = responseBody['webtoons'];

        for (var webtoon in webtoons) {
          webtoonModelList.add(WebtoonModel.fromJson(webtoon));
        }
      }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
