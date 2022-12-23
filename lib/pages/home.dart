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
    return Scaffold(
        appBar: AppBar(
          title: Text("Anibase"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Anime>?>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final modelRank = snapshot.data![index].rank;
                  final modelTitle = snapshot.data![index].title;
                  return Card(
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Text("$modelRank"),
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
