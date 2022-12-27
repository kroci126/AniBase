part of 'pages.dart';

class Seasonal extends StatefulWidget {
  const Seasonal({Key? key}) : super(key: key);

  @override
  _SeasonalState createState() => _SeasonalState();
}

class _SeasonalState extends State<Seasonal> {
  late final future = getRecommendedAnime();

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return Scaffold(
        appBar: AppBar(
          title: Text("Anime This Season"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Anime>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final modelRank = snapshot.data![index].rank;
                  final modelTitle = snapshot.data![index].title.toString();
                  final modelImage =
                      snapshot.data![index].images!.jpg!.imageUrl;
                  return Card(
                    elevation: 20,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Image(
                          width: 200,
                          image: NetworkImage(modelImage.toString()),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(modelTitle),
                      ]),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
