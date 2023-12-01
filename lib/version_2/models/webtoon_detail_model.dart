import 'package:mvvm_practice/version_2/models/webtoon_model.dart';

class WebtoonDetailModel extends WebtoonModel {
  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : synopsys = json['about'],
        genre = json['genre'],
        age = json['age'],
        super.fromJson(json);

  final String synopsys;
  final String genre;
  final String age;
}
