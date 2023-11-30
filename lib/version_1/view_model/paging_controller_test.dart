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
  final String _scheme = 'https';
  final String _host = 'korea-webtoon-api.herokuapp.com';
  final String _service = 'naver';
  final String _perPage = '24';
  final String _updateDay =
      DateFormat('EEE').format(DateTime.now()).toLowerCase();

  late  var _queryParameters;
  late var _requestUri;

  PagingControllerTest() {
    pagingController.addPageRequestListener((pageKey) {
      _load(pageKey);
    });
  }

  _load(int pageKey) async {
    _queryParameters = {
      'page': '$pageKey',
      'perPage': _perPage,
      'service': _service,
      'updateDay': _updateDay,
    };

    _requestUri = Uri(
      scheme: _scheme,
      host: _host,
      queryParameters: _queryParameters,
    );
    print('requestUri : $_requestUri');

    try {
      final response = await http.get(_requestUri);
      print('response.statusCode : ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        var webtoons = responseBody['webtoons'];
        List<WebtoonModel> newItems = [];

        for (var webtoon in webtoons) {
          newItems.add(WebtoonModel.fromJson(webtoon));
        }

        final isLastPage = newItems.length < int.parse(_perPage);
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems, nextPageKey);
          print('nextPageKey : $nextPageKey');
        }
      }
    } catch (e) {
      pagingController.error = e;
    } finally {
      notifyListeners();
    }
  }
}
