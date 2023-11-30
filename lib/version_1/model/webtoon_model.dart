class WebtoonModel {
  final String title, url, img;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        img = json['img'];
}
