class WebtoonModel {
  final String title, img, author;
  final int id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        img = json['img'],
        author = json['author'],
        id = json['webtoonId'] % 1000000000000;

  WebtoonModel.fromModel(WebtoonModel model)
      : title = model.title,
        img = model.img,
        author = model.author,
        id = model.id;
}
