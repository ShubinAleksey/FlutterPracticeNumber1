import 'package:flutter/material.dart';
import 'package:flutter_conduit/addfinance.dart';
import 'package:flutter_conduit/finance.dart';
import 'package:flutter_conduit/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const AddFinance(),
    const FinancePage(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_to_queue), label: "Главная"),
          BottomNavigationBarItem(
              icon: Icon(Icons.percent_sharp), label: "Финансы"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded), label: "Профиль")
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
