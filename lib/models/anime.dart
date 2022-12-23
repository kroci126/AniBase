part of 'models.dart';

class Anime {
  Anime({
    required this.title,
    required this.rank,
    this.imageUrl = '',
  });

  String title;
  int rank;
  String imageUrl;
  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
      title: json["title"], rank: json["rank"], imageUrl: json["image_url"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "rank": rank,
        "image_url": imageUrl,
      };
}
