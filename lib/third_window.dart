import 'package:flutter/material.dart';

// ignore: camel_case_types
class MeditateLessons extends StatefulWidget {
  const MeditateLessons({Key? key}) : super(key: key);

  @override
  State<MeditateLessons> createState() => _MeditateLessons();
}

// ignore: camel_case_types
class _MeditateLessons extends State<MeditateLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Meditate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/search.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 10),
              child: Container(
                  height: 1, width: double.infinity, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        minimumSize: const Size(35, 35),
                      ),
                      child: const Text(
                        'All',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 135, 233, 223),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        minimumSize: const Size(35, 35),
                      ),
                      child: const Text(
                        'Bible In a Year',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 135, 233, 223),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        minimumSize: const Size(35, 35),
                      ),
                      child: const Text(
                        'Dailies',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 135, 233, 223),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        minimumSize: const Size(35, 35),
                      ),
                      child: const Text(
                        'Minutes',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 135, 233, 223),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        minimumSize: const Size(35, 35),
                      ),
                      child: const Text(
                        'November',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 135, 233, 223),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        minimumSize: const Size(35, 35),
                      ),
                      child: const Text(
                        'December',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    minimumSize: const Size(35, 35)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                          width: 340,
                          height: 250,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Image.asset('assets/sun_moon.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "A Song Of Moon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 1),
                              child: Text(
                                "Start With Basics",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 113, 112, 112),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 10,
                                    height: 10,
                                    child: Image.asset('assets/heart.png'),
                                  ),
                                ),
                                const Expanded(
                                  flex: 3,
                                  child: Text(
                                    "9 Sessions",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Start >",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 161,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.2),
                                  ),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                            'assets/thesleephour.png')),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 2, top: 2),
                                      child: Text(
                                        "The Sleep Hour",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        "Ashna Mukherjee",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 10,
                                            height: 10,
                                            child: Image.asset('assets/heart.png'),
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 3,
                                          child: Text(
                                            "3 Sessions",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Start >",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 160,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.2),
                                  ),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                            'assets/easy_mission.png')),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 2, top: 2),
                                      child: Text(
                                        "Easy on the Mission",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        "Peter Mach",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 10,
                                            height: 10,
                                            child: Image.asset('assets/heart.png'),
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 3,
                                          child: Text(
                                            "5 minutes",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Start >",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Row(
                children: [
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 161,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.2),
                                  ),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                            'assets/relax_with_me.png')),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 2, top: 2),
                                      child: Text(
                                        "Relax with Me",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        "Amanda James",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 10,
                                            height: 10,
                                            child: Image.asset('assets/heart.png'),
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 3,
                                          child: Text(
                                            "3 Sessions",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Start >",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 160,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.2),
                                  ),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                            'assets/sun_energy.png')),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 2, top: 2),
                                      child: Text(
                                        "Sun and Energy",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        "Micheal Hiu",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 10,
                                            height: 10,
                                            child: Image.asset('assets/heart.png'),
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 3,
                                          child: Text(
                                            "5 minutes",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Start >",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
