part of '../models.dart';

class Anime extends Equatable {
  final int? malId;
  final Images? images;
  final String? title;
  final String? titleEnglish;
  final String? titleJapanese;
  final int? rank;

  const Anime({
    this.malId,
    this.images,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.rank,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        malId: json['mal_id'] as int?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        title: json['title'] as String?,
        titleEnglish: json['title_english'] as String?,
        titleJapanese: json['title_japanese'] as String?,
        rank: json['rank'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'images': images?.toJson(),
        'title': title,
        'title_english': titleEnglish,
        'title_japanese': titleJapanese,
        'rank': rank,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      malId,
      images,
      title,
      titleEnglish,
      titleJapanese,
      rank,
    ];
  }
}
