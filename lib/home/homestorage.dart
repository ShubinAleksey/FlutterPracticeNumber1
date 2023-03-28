import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/storeprofile/profile.dart';
import 'package:flutter_application_firebase/storeprofile/storeimages.dart';
import 'package:flutter_application_firebase/storeprofile/users.dart';

class HomeStorage extends StatefulWidget {
  const HomeStorage({Key? key}) : super(key: key);

  @override
  State<HomeStorage> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<HomeStorage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const StoreImages(),
    const ProfileScreen(),
    const Users(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.image_search_sharp), label: "Альбом"),
          BottomNavigationBarItem(
              icon: Icon(Icons.portrait_rounded), label: "Профиль"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), label: "Пользователи"),
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