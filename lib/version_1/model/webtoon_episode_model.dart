class WebtoonEpisodeModel {
  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json, int id)
      : this.thumbUrl = json['thumb'],
        this.title = json['title'],
        this.id = id,
        this.episodeId = json['id'];

  final String thumbUrl;
  final String title;
  final int id;
  final String episodeId;
}
