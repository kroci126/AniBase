part of 'services.dart';

Future<List<Anime>?> getTopAnime() async {
  final response =
      await http.get(Uri.parse("https://api.jikan.moe/v4/top/anime"));
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    List<dynamic> data = res['data'];
    List<Anime> movies = data.map((dynamic d) => Anime.fromJson(d)).toList();
    return movies;
  } else {
    throw Exception("Error");
  }
}
