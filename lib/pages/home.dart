part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required String title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final future = getTopAnime();

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return Scaffold(
        appBar: AppBar(
          title: Text("Top Anime"),
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
                        Text("$modelRank" + ". " + "$modelTitle"),
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
