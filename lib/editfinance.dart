import 'package:flutter/material.dart';
import 'package:flutter_conduit/dio/auth_dio.dart';
import 'package:flutter_conduit/finance.dart';

class EditFinance extends StatefulWidget {
  const EditFinance({Key? key}) : super(key: key);

  @override
  State<EditFinance> createState() => _EditFinanceState();
}

class _EditFinanceState extends State<EditFinance> {
  var jsonList;
  late int category;

  @override
  void initState() {
    super.initState();
    getCateg();
  }

  final List<DropdownMenuItem<String>> list = [];
  List<DropdownMenuItem<String>> get dropdownItems {
    return list;
  }

  void getCateg() async {
    try {
      final AuthDioUtils listFinance = AuthDioUtils();
      var response = await listFinance.dio.get("/finance");

      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data;
          for (var i = 0; i < jsonList['data'].length; i++) {
            list.add(DropdownMenuItem(
                value: i.toString(),
                child: Text(jsonList['data'][i]['operationName'].toString())));
          }
          _operationNumberController.text = "";
          _operationNameController.text = "";
          _descController.text = "";
          _summController.text = "";
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void editFinanceNew() async {
    try {
      final AuthDioUtils listFinance = AuthDioUtils();
      var response = await listFinance.dio
          .put("/finance/${jsonList['data'][category]['id']}", data: {
        'operationNumber': int.parse(_operationNumberController.text),
        'operationName': _operationNameController.text,
        'description': _descController.text,
        'transactionAmount': int.parse(_summController.text)
      });

      if (response.statusCode == 200) {
        const snackBar = SnackBar(
          content: Text('Сводка обновлена'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FinancePage()));
      } else {
        const snackBar = SnackBar(
          content: Text('Ошибка обновления'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }

  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _operationNumberController = TextEditingController();
  final TextEditingController _operationNameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _summController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Редактирование',
            style: TextStyle(color: Color.fromARGB(255, 21, 115, 178)),
          ),
          actions: const [],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: SizedBox(
                height: 750,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 60),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(248, 68, 139, 226)),
                    child: Container(
                      height: double.infinity, //height of TabBarView
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Изменение финансовой сводки",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 21, 115, 178),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _operationNumberController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Введите число',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _operationNameController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Введите название',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              obscureText: false,
                              controller: _descController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Введите описание',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _summController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Введите сумму',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12),
                          ),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.arrow_drop_down_outlined),
                              hintText: 'Выберите финансовую сводку',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: TextStyle(color: Colors.yellow),
                            ),
                            items: dropdownItems,
                            onChanged: (value) {
                              category = int.parse(value.toString());
                              print(category);
                              _operationNumberController.text = jsonList['data']
                                      [category]['operationNumber']
                                  .toString();
                              _operationNameController.text = jsonList['data']
                                      [category]['operationName']
                                  .toString();
                              _descController.text = jsonList['data'][category]
                                      ['description']
                                  .toString();
                              _summController.text =
                                  jsonList['data'][category]['transactionAmount'].toString();
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12),
                          ),
                          SizedBox(
                            height: 50.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: ElevatedButton(
                                onPressed: () {
                                  editFinanceNew();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.greenAccent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    )),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Изменить справку",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )))));
  }
}
