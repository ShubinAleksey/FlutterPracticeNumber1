import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(248, 68, 139, 226)),
          child: Center(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 35),
                    child: Text("Администратор",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 115, 178),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ))),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 35),
                  child: Text("Добро пожаловать в систему админа",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 21, 115, 178),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Назад',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
