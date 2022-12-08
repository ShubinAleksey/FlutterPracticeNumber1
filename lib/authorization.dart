import 'package:flutter/material.dart';
import 'package:flutter_practice_2/Admin.dart';
import 'package:flutter_practice_2/Cassir.dart';
import 'package:flutter_practice_2/core/db/data_base_helper.dart';
import 'package:flutter_practice_2/data/repositories/auth_repository_impl.dart';
import 'package:flutter_practice_2/domain/usecase/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  loginValidator(String login) {
    if (login.isEmpty) {
      return false;
    } else if (login.length < 5) {
      return false;
    } else if (login.length > 15) {
      return false;
    }
    return true;
  }

  //password validator possible structure
  passwordValidator(String password) {
    if (password.isEmpty) {
      return false;
    } else if (password.length < 5) {
      return false;
    } else if (password.length > 16) {
      return false;
    }
    return true;
  }

  nameValidator(String name) {
    if (name.isEmpty) {
      return false;
    } else if (name.length < 5) {
      return false;
    } else if (name.length > 15) {
      return false;
    }
    return true;
  }

  surnameValidator(String surname) {
    if (surname.isEmpty) {
      return false;
    } else if (surname.length < 5) {
      return false;
    } else if (surname.length > 15) {
      return false;
    }
    return true;
  }

  middleNameValidator(String middleName) {
    if (middleName.isEmpty) {
      return true;
    } else if (middleName.length < 5) {
      return false;
    } else if (middleName.length > 15) {
      return false;
    }
    return true;
  }

  seriaPassportValidator(String seriaPassport) {
    if (seriaPassport.isEmpty) {
      return false;
    } else if (seriaPassport.length < 3) {
      return false;
    } else if (seriaPassport.length > 5) {
      return false;
    }
    return true;
  }

  nomerPassportValidator(String nomerPassport) {
    if (nomerPassport.isEmpty) {
      return false;
    } else if (nomerPassport.length < 5) {
      return false;
    } else if (nomerPassport.length > 7) {
      return false;
    }
    return true;
  }

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _seriaPassController = TextEditingController();
  final TextEditingController _nomerPassController = TextEditingController();
  final TextEditingController _loginController2 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      final AuthReposityImpl auth = AuthReposityImpl();
      await Auth(auth).signUp(AuthParams(
        login: _loginController.text,
        password: _passwordController.text,
        name: _nameController.text,
        surname: _surnameController.text,
        middleName: _middleNameController.text,
        seriaPassport: _seriaPassController.text,
        nomerPassport: _nomerPassController.text,
      ));
    }

    void signIn() async {
      final AuthReposityImpl auth = AuthReposityImpl();
      var result = await Auth(auth).signIn(AuthParams(
        login: _loginController2.text,
        password: _passwordController2.text,
        name: "-",
        surname: "-",
        middleName: "-",
        seriaPassport: "-",
        nomerPassport: "-",
      ));
      String f = result.toString();
      if (f.contains("admin") == true) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Admin()));
      } else if (f.contains("cassir") == true) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Cassir()));
      } else {
        const snackBar = SnackBar(
          content: Text('Ошибка авторизации'),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(248, 68, 139, 226)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    const Text('Магазин',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 21, 115, 178),
                          fontWeight: FontWeight.bold,
                        )),
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
                              Tab(text: "Регистрация"),
                              Tab(text: "Авторизация"),
                            ],
                          ),
                          Container(
                            height: 600, //height of TabBarView
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(
                              children: <Widget>[
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
                                          color:
                                              Color.fromARGB(255, 21, 115, 178),
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _loginController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите логин',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите пароль',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _nameController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите имя',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _surnameController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите фамилию',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _middleNameController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите отчество',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _seriaPassController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите серию пасспорта',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _nomerPassController,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите номер пасспорта',
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
                                            if ((loginValidator(
                                                        _loginController
                                                            .text) ==
                                                    true) &
                                                (passwordValidator(_passwordController
                                                        .text) ==
                                                    true) &
                                                (nameValidator(
                                                        _nameController.text) ==
                                                    true) &
                                                (surnameValidator(
                                                        _surnameController
                                                            .text) ==
                                                    true) &
                                                (middleNameValidator(
                                                        _middleNameController
                                                            .text) ==
                                                    true) &
                                                (seriaPassportValidator(
                                                        _seriaPassController
                                                            .text) ==
                                                    true) &
                                                (nomerPassportValidator(
                                                        _nomerPassController
                                                            .text) ==
                                                    true)) {
                                              signUp();
                                              const snackBar2 = SnackBar(
                                                content:
                                                    Text('Добро пожаловать!'),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar2);
                                            } else {
                                              const snackBar = SnackBar(
                                                content: Text('Ошибка!'),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
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
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Регистрация",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
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
                                          color:
                                              Color.fromARGB(255, 21, 115, 178),
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _loginController2,
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Введите логин',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: TextFormField(
                                        controller: _passwordController2,
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
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Авторизоваться",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
