import 'package:flutter/material.dart';

// ignore: camel_case_types
class Meditate_now extends StatefulWidget {
  const Meditate_now({Key? key}) : super(key: key);

  @override
  State<Meditate_now> createState() => _Meditate_now();
}

// ignore: camel_case_types
class _Meditate_now extends State<Meditate_now> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                ),
                child: Image.asset('assets/mind_relax.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 18, bottom: 15),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Peter Mach',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, bottom: 5),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Mind Deep Relax',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, bottom: 15),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: SizedBox(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Image.asset('assets/play.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                        ),
                        const Text("Play Next Session",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            )),
                      ],
                    )),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(50, 50),
                        ),
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/play.png'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      Column(
                        children: const [
                          Text(
                            'Sweet Memories',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'December 29 Pre-Launch',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 7,
                          width: 7,
                          child: Image.asset('assets/dots.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 15),
                    child: Container(
                        height: 1, width: double.infinity, color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(50, 50),
                        ),
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/play.png'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      Column(
                        children: const [
                          Text(
                            'A Day Dream',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'December 29 Pre-Launch',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 7,
                          width: 7,
                          child: Image.asset('assets/dots.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 15),
                    child: Container(
                        height: 1, width: double.infinity, color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(50, 50),
                        ),
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/play.png'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      Column(
                        children: const [
                          Text(
                            'Mind Explore',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'December 29 Pre-Launch',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 7,
                          width: 7,
                          child: Image.asset('assets/dots.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
