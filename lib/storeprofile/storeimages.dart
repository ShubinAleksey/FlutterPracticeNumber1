import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/firebase_options.dart';
import 'package:flutter_application_firebase/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseFirestore fireStore = FirebaseFirestore.instance;
QuerySnapshot? querySnapshot;
SharedPreferences? sharedPreferences;
List<Map<String, dynamic>> userList = [];
CollectionReference usersImage =
    FirebaseFirestore.instance.collection('images');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoreImages());
}

class StoreImages extends StatelessWidget {
  const StoreImages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: false,
      ),
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'Мои картинки'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();

  void _incrementCounter() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      dialogTitle: 'Выбор файла',
    );
    if (result != null) {
      final size = result.files.first.size;
      final file = io.File(result.files.single.path!);
      final fileExtensions = result.files.first.extension!;
      print("размер:$size file:${file.path} fileExtensions:$fileExtensions");
      String names = getRandomString(5);
      await FirebaseStorage.instance.ref().child(names).putFile(file);

      final urlFile =
          await FirebaseStorage.instance.ref().child(names).getDownloadURL();
      final imagesAdd = fireStore.collection('images');
      imagesAdd
          .add(
            {
              'name': names,
              'nameFile': names,
              'size': result.files.first.size,
              'url': urlFile,
              'user': sharedPreferences!.getString('users')
            },
          )
          .then((value) => print('Add image'))
          .catchError((error) => print('Faild add: $error'));
    } else {}
    initImage();
  }

  Future<void> deleteImage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await FirebaseStorage.instance.ref("/$fullname").delete();
    if (link != '') {
      querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('url', isEqualTo: link)
          .get();
      fullpath.clear();

      querySnapshot?.docs.forEach((doc) async {
        await usersImage.doc(doc.id).delete();
      });
    }
    initImage();
  }

  String link = '';
  String fullname = '';
  List<ModelTest> fullpath = [];

  Future<void> updateImage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (link != '') {
      querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('url', isEqualTo: link)
          .get();
      fullpath.clear();

      querySnapshot?.docs.forEach((doc) async {
        await usersImage.doc(doc.id).update({'nameFile': _nameController.text});
      });
    }
    initImage();
  }

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> initImage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    querySnapshot = await FirebaseFirestore.instance
        .collection('images')
        .where('user', isEqualTo: sharedPreferences!.getString('users'))
        .get();
    fullpath.clear();

    final storageReference = querySnapshot!.docs.toList();
    final list = storageReference;
    list.forEach((element) async {
      final url = await element.get('url');
      final name = await element.get('nameFile');
      final nameFile = await element.get('name');
      final size = await element.get('size');
      fullpath.add(ModelTest(url, name, size, nameFile));
      setState(() {
        link = '';
        _nameController.text = '';
      });
    });
  }

  @override
  void initState() {
    initImage().then(
      (value) {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.blue,
        title: const Text(
          'Альбом',
          style: TextStyle(color: Colors.greenAccent),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await initImage();
              },
              icon: const Icon(Icons.refresh)),
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
      body: Center(
        child: Container(
          decoration:
                const BoxDecoration(color: Color.fromARGB(248, 160, 227, 221)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Название файла',
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await updateImage();
                        },
                        icon: const Icon(Icons.refresh)),
                    Image.network(
                      link,
                      width: 150,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Картинка не выбрана');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: fullpath.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onLongPress: () async {
                          link = fullpath[index].url;
                          fullname = fullpath[index].nameFile;
                          await deleteImage();
                        },
                        onTap: () {
                          setState(() {
                            link = fullpath[index].url;
                            _nameController.text = fullpath[index].name;
                          });
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                              fullpath[index].url,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text('');
                              },
                            ),
                          ),
                          title: Text("Название: ${fullpath[index].name}"),
                          subtitle: Text(
                              "Размер: ${fullpath[index].size} Ссылка: ${fullpath[index].url}"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ModelTest {
  final String url;
  final String name;
  final String nameFile;
  final int size;

  ModelTest(this.url, this.name, this.size, this.nameFile);
}
