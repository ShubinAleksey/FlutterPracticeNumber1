import 'package:flutter/material.dart';
import 'package:flutter_practice_2/app_router.dart';
import 'package:flutter_practice_2/core/db/data_base_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRouter,
      initialRoute: namePageTest,
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('1'),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, namePageTest1, (route) => false);
          },
          child: const Text('Переход на экран 2'),
        )
      ]),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('2'),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Переход на экран 1'),
        )
      ]),
    );
  }
}
