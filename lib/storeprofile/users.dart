import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/home/home.dart';
import 'package:flutter_application_firebase/home/homestorage.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UsersState();
}

class UsersState extends State<Users> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.purple,
        title: const Text(
          'Пользователи',
          style: TextStyle(color: Colors.greenAccent),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        decoration:
                const BoxDecoration(color: Color.fromARGB(248, 160, 227, 221)),
        child: Center(
          child: StreamBuilder(
            stream: _usersStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        child: Text(
                          data['name'].toString().substring(0),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      );
                    })
                    .toList()
                    .cast(),
              );
            },
          ),
        ),
      ),
    );
  }
}
