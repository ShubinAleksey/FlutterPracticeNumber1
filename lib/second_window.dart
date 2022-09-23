import 'package:flutter/material.dart';

// ignore: camel_case_types
class MedinowNOW extends StatefulWidget {
  const MedinowNOW({Key? key}) : super(key: key);

  @override
  State<MedinowNOW> createState() => _MedinowNOW();
}

// ignore: camel_case_types
class _MedinowNOW extends State<MedinowNOW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 162, 167),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 149, bottom: 3),
              ),
              SizedBox(
                width: 180,
                height: 30,
                child: Image.asset('assets/medinow.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 75),
                child: const Text(
                  'Meditate With Us!',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  minimumSize: const Size(340, 70),
                ),
                child: const Text(
                  'Sign in with Apple',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 105, 224, 228),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  minimumSize: const Size(340, 70),
                ),
                child: const Text(
                  'Continue with Email or Phone',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Continue With Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                child: Image.asset('assets/medinow_man.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
