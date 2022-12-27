part of 'pages.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userDisplayName = "";
  var userEmail = "";

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void getUserProfile() async {
    var tempDisplayName = await AuthService.getDisplayName();
    var tempEmail = await AuthService.getEmail();
    setState(() {
      userDisplayName = tempDisplayName;
      userEmail = tempEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Profile'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthService.signOut().then((value) {
                  if (value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    UiToast.toastOk("Logout successful!");
                  } else {
                    UiToast.toastErr("Logout failed!");
                  }
                });
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage("${AuthService.auth.currentUser!.photoURL}"),
            ),
            SizedBox(height: 20),
            Text("Username: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("${AuthService.auth.currentUser!.displayName}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Email: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("${AuthService.auth.currentUser!.email}",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
