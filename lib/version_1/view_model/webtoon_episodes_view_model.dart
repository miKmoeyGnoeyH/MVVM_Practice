import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_practice/version_1/model/webtoon_episode_model.dart';
import 'package:http/http.dart' as http;

final webtoonEpisodeListProvider =
    ChangeNotifierProvider((_) => WebtoonEpisodeListViewModel());

class WebtoonEpisodeListViewModel extends ChangeNotifier {
  List<WebtoonEpisodeModel>? webtoonEpisodeModels = [];

  WebtoonEpisodeListViewModel() {
    webtoonEpisodeModels = [];
  }

  load(int id) async {
    webtoonEpisodeModels = [];

    final String url =
        'https://webtoon-crawler.nomadcoders.workers.dev/$id/episodes';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final webtoonEpisodes = jsonDecode(response.body);

        for (var episode in webtoonEpisodes) {
          webtoonEpisodeModels!.add(WebtoonEpisodeModel.fromJson(episode, id));
        }
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      webtoonEpisodeModels = null;
    } finally {
      print(webtoonEpisodeModels);
      notifyListeners();
    }
  }
}
