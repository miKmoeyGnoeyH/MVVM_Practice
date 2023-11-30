class WebtoonModel {
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        img = json['img'],
        author = json['author'],
        id = json['webtoonId'] % 1000000000000;

  final String title;
  final String img;
  final String author;
  final int id;
}
