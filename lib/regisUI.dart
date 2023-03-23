import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => MyApp();
}

class MyApp extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Регистрация',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 197, 75, 218),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController2 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _emailController2 = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      const pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
      final regex = RegExp(pattern);

      return value!.isNotEmpty && !regex.hasMatch(value)
          ? 'Введите правильную почту'
          : null;
    }

    void signUpEmailPassword() async {
      try {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _userNameController2.text,
            password: _passwordController2.text);
        const snackBar = SnackBar(
          content: Text('Успешная регистрация'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } on FirebaseAuthException catch (e) {
        const snackBar = SnackBar(
          content: Text('Ошибка ввода данных'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void signInEmailPassword() async {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _userNameController.text,
            password: _passwordController.text);
        print(user.user?.email);
        print(user.user?.uid);
        const snackBar = SnackBar(
          content: Text('Успешная авторизация'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } on FirebaseAuthException catch (e) {
        const snackBar = SnackBar(
          content: Text('Ошибка ввода данных'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void signInAnonimous() async {
      try {
        final user = await FirebaseAuth.instance.signInAnonymously();
        print(user.user?.uid);
        const snackBar = SnackBar(
          content: Text('Успешная авторизация под анонимным пользователем'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } on FirebaseAuthException catch (e) {
        print(e);
        const snackBar = SnackBar(
          content: Text('Ошибка'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void SentEmailLink() async {
      try {
        var emailAuth = _userNameController.text;
        var acs = ActionCodeSettings(
            url: 'http://localhost:9999/#/?email=$emailAuth',
            handleCodeInApp: true,
            androidInstallApp: true);
        var response = await FirebaseAuth.instance
            .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs);
        const snackBar = SnackBar(
          content: Text('Ссылка отправлена'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } on FirebaseAuthException catch (e) {
        print(e);
        const snackBar = SnackBar(
          content: Text('Ошибка'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 750,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 120),
            decoration:
                const BoxDecoration(color: Color.fromARGB(248, 68, 139, 226)),
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("Регистрация",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _userNameController2,
                      autovalidateMode: AutovalidateMode.always,
                      validator: validateEmail,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Введите почту',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController2,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Введите пароль',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          signUpEmailPassword();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            )),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Регистрация",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
