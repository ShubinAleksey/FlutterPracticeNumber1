import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conduit/cubit/user_cubit.dart';
import 'package:flutter_conduit/dio/auth_dio.dart';
import 'package:flutter_conduit/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => MyApp();
}

class MyApp extends State<Welcome> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => UserCubit()),
        ],
        child: MaterialApp(
          title: 'Финансовые ставки',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  usernameValidator(String username) {
    if (username.isEmpty) {
      return false;
    } else if (username.length < 2) {
      return false;
    } else if (username.length > 20) {
      return false;
    }
    return true;
  }

  passwordValidator(String password) {
    if (password.isEmpty) {
      return false;
    } else if (password.length < 4) {
      return false;
    } else if (password.length > 20) {
      return false;
    }
    return true;
  }

  emailValidator(String email) {
    if (email.isEmpty) {
      return false;
    } else if (email.length < 4) {
      return false;
    } else if (email.length > 20) {
      return false;
    } else if (!email.contains("@")) {
      return false;
    } else {
      return true;
    }
  }

  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController2 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _emailController2 = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      final AuthDioUtils regist = AuthDioUtils();
      var result = await regist.Registration(
        _userNameController2.text,
        _passwordController2.text,
        _emailController2.text,
      );
      String f = result.toString();
      if (f.contains("true") == true) {
        const snackBar = SnackBar(
          content: Text('Регистрация пройдена'),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text('Ошибка регистрации'),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void signIn() async {
      final AuthDioUtils auth = AuthDioUtils();
      var result =
          await auth.Authenticate(_userNameController.text, _passwordController.text);
      String f = result.toString();
      if (f.contains("true") == true) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        const snackBar = SnackBar(
          content: Text('Ошибка авторизации'),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(248, 68, 139, 226)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            const SizedBox(height: 20.0),
            const Text('Финансовые ставки',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const TabBar(
                        labelColor: Colors.purple,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                              icon: Icon(IconData(0xf672,
                                  fontFamily: 'MaterialIcons'))),
                          Tab(
                              icon: Icon(IconData(0xf522,
                                  fontFamily: 'MaterialIcons'))),
                        ],
                      ),
                      Container(
                          height: 700,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Регистрация",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 21, 115, 178),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: TextFormField(
                                    controller: _userNameController2,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Введите никнейм',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _passwordController2,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Введите пароль',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: TextFormField(
                                    controller: _emailController2,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Введите email',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if ((usernameValidator(_userNameController2.text) == true) &
                                            (passwordValidator(
                                                    _passwordController2
                                                        .text) ==
                                                true) &
                                            (emailValidator(
                                                    _emailController2.text) ==
                                                true)) {
                                          signUp();
                                        }
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.greenAccent),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          )),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text("Регистрация",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Авторизация",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 21, 115, 178),
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: TextFormField(
                                      controller: _userNameController,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Введите никнейм',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Введите пароль',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          signIn();
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.greenAccent),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0),
                                              ),
                                            )),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text("Авторизоваться в системе",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black)),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ]),
                          ]))
                    ])),
          ]),
        ),
      ),
    );
  }
}
