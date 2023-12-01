import 'package:mvvm_practice/version_1/model/webtoon_model.dart';

class WebtoonDetailModel extends WebtoonModel {
  WebtoonDetailModel.fronJson(Map<String, dynamic> json, WebtoonModel item)
      : this.synopsys = json['about'],
        this.genre = json['genre'],
        this.age = json['age'],
        super.fromModel(item);

  final String synopsys;
  final String genre;
  final String age;
}
