import 'package:flutter/material.dart';
import 'package:flutter_practice_2/Cassir.dart';
import 'package:flutter_practice_2/authorization.dart';
import 'package:flutter_practice_2/main.dart';

const String namePageTest = 'test';
const String namePageTest1 = 'test1';
const String namePageTest2 = 'test2';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case namePageTest:
        {
          return MaterialPageRoute(builder: (_) => const MyApp());
        }
      case namePageTest1:
        {
          return MaterialPageRoute(builder: (_) => App());
        }

      case namePageTest2:
        {
          return MaterialPageRoute(builder: (_) => Cassir());
        }
    }
    return null;
  }
}
