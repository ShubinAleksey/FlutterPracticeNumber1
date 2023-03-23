import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/authorization.dart';
import 'package:flutter_application_firebase/regisUI.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Registration(),
    const Authorization(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.app_registration), label: "Регистрация"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), label: "Авторизация"),
        ],
        currentIndex: currentIndex,
        onTap: ((value) {
          setState(() {
            currentIndex = value;
          });
        }),
      ),
      body: pages[currentIndex],
    );
  }
}