import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conduit/cubit/user_cubit.dart';
import 'package:flutter_conduit/dio/auth_dio.dart';
import 'package:flutter_conduit/welcome.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void initState() {
    AuthDioUtils()
        .getUser()
        .then((value) => context.read<UserCubit>().onLoad(value));
    super.initState();
  }

  void refreshProfile() async {
    final AuthDioUtils ref = AuthDioUtils();
    var result = await ref.changeProfile(
        _userNameController.text,
        _emailController.text,
        _oldPasswordController.text,
        _newPasswordController.text);
    String f = result.toString();
    if (f.contains("true") == true) {
      const snackBar = SnackBar(
        content: Text('Изменение успешно'),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
    } else {
      const snackBar = SnackBar(
        content: Text('Ошибка изменения'),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.greenAccent,
          title: const Text(
            'Мой профиль',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Welcome()));
              },
            ),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserData) {
                  _userNameController.text = (state).user.userName;
                  _emailController.text = (state).user.email;
                }
                return Column(
                  children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Мой логин',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Мой email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
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
                            Text("Изменить профиль",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ]),
                    ),
                  ),
                ),
                  ],
                );
              },
            ),
          ],
        ));
  }
}
