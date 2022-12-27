part of 'services.dart';

Future<List<Anime>> getTopAnime() async {
  final response =
      await http.get(Uri.parse("https://api.jikan.moe/v4/top/anime"));
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    List<dynamic> data = res['data'];
    List<Anime> top = data.map((dynamic d) => Anime.fromJson(d)).toList();
    return top;
  } else {
    throw Exception("Error");
  }
}

Future<List<Anime>> getRecommendedAnime() async {
  final response =
      await http.get(Uri.parse("https://api.jikan.moe/v4/seasons/now"));
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    List<dynamic> data = res['data'];
    List<Anime> rcmd = data.map((dynamic d) => Anime.fromJson(d)).toList();
    return rcmd;
  } else {
    throw Exception("Error");
  }
}

Future<List<Anime>> getAnimeById(int malId) async {
  final response =
      await http.get(Uri.parse("https://api.jikan.moe/v4/anime/$malId"));
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    List<dynamic> data = res['data'];
    List<Anime> rcmd = data.map((dynamic d) => Anime.fromJson(d)).toList();
    return rcmd;
  } else {
    throw Exception("Error");
  }
}
