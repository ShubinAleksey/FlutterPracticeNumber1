import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

QuerySnapshot? querySnapshot;
CollectionReference users = FirebaseFirestore.instance.collection('users');

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(_setscreen);
  }

  Future<void> _setscreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString('users'));
    querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: sharedPreferences.getString('users'))
        .get();
    _emailController.text = querySnapshot?.docs.first.get('name');
  }

  void refreshProfile() async {
    if (querySnapshot?.docs.first.get('password') ==
        _oldPasswordController.text) {
      querySnapshot?.docs.forEach((doc) {
        users.doc(doc.id).update({'password': _newPasswordController.text});
      });
      final User? user = FirebaseAuth.instance.currentUser;
      await user?.updatePassword(_newPasswordController.text);
    } else {
      const snackBar = SnackBar(
        content: Text('Неверный пароль'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.blue,
        title: const Text(
          'Мой профиль',
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
      body: SingleChildScrollView(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(248, 160, 227, 221)),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Почта',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: _oldPasswordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Введите старый пароль',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: _newPasswordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Введите новый пароль',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          refreshProfile();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Редактировать профиль",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
