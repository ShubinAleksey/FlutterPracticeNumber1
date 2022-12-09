import 'package:flutter/material.dart';
import 'package:flutter_application_5/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/theme_cubit.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeMode themeMode = ThemeMode.light;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initShared().then((value) {
      setState(() {
        if (sharedPreferences!.getBool("isTheme") != null &&
            sharedPreferences!.getBool("isTheme") as bool) {
          themeMode = ThemeMode.dark;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubbit()),
      ],
      child: BlocBuilder<ThemeCubbit, ThemeMode> (
        builder: (context, state) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state,
          home: const MyHomePage(title: 'SPrefCubit',),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController edtText = TextEditingController();

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      edtText.text = (prefs.getString('text') ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      edtText.text = ((prefs.getString('text') ?? "") + edtText.text);
      prefs.setString('text', edtText.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: edtText,          
              ),
            ),
            ElevatedButton(onPressed: (){
              _incrementCounter();
              Navigator.push(context, MaterialPageRoute(builder: (c) => Screen(text: edtText.text)));
            }, child: const Text("Перейти"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Theme.of(context).tabBarTheme == ThemeMode.light) {
            sharedPreferences!.setBool("isTheme", true);
          } else {
            sharedPreferences!.setBool("isTheme", false);
          }
          context.read<ThemeCubbit>().toggleTheme();
        }, tooltip: 'Тема',
          child: const Icon(Icons.add),
      ),
    );
  }
}
