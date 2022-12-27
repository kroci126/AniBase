part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginkey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHide = true;
  bool isLoading = false;

  var emailLogin;
  var uidLogin;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // color: Colors.orange,
            width: double.infinity,
            height: 400,
            padding: EdgeInsets.fromLTRB(16, 240, 16, 16),
            child: Center(
              child: Form(
                key: _loginkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            await AuthService.signInWithGoogle();
                            emailLogin = await AuthService.getEmail();
                            uidLogin = await AuthService.getUid();
                            /*
                            ** Add data user to database after success login with google account
                            */
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            elevation: 0,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.fromLTRB(24, 14, 24, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Sign In with Google",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
