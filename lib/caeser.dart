import 'package:flutter/material.dart';

import 'coomon.dart';
import 'mine.dart';

class Caesar extends StatefulWidget {
  const Caesar({Key? key}) : super(key: key);

  @override
  State<Caesar> createState() => _CaesarState();
}

class _CaesarState extends State<Caesar> {
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String result = " ";
  String result2 = " ";

  late int _key;

  @override
  void dispose() {
    _wordController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey.withOpacity(.2),
        appBar: AppBar(
            backgroundColor: Colors.blueGrey.withOpacity(.2),
            title: custom_text(
              text: 'Caesar Cipher',
              color: Colors.white,
              fontFamily: 'Amiri',
              size: 25,
              fontWeight: FontWeight.normal,
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  nextScreenReplace(context, const Home());
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ))),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xffF02E65)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      labelText: 'Write text here : ',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Amiri",
                      )),
                  controller: _wordController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xffF02E65)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      labelText: 'Write the key here : ',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Amiri",
                      )),
                  controller: _keyController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.tealAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ))),
                        child: custom_text(
                            text: "Encrypt",
                            size: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontFamily: "Amiri"),
                        onPressed: () {
                          this.encrypt();
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.brown),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ))),
                        child: custom_text(
                            text: "Decrypt",
                            size: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontFamily: "Amiri"),
                        onPressed: () {
                          this.decrypt();
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ))),
                        child: custom_text(
                            text: "Clear",
                            size: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontFamily: "Amiri"),
                        onPressed: () {
                          delete();
                        },
                      ),
                    ]),
                SizedBox(
                  height: 15,
                ),
                custom_text(
                    text: "Result : ",
                    size: 35,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Pacifico"),
                SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        result,
                        style: TextStyle(color: Colors.green, fontSize: 35),
                      ),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void delete() {
    _wordController.clear();
    _keyController.clear();
    setState(() {
      result = "";
    });
  }

  void encrypt() {
    String _text = _wordController.text;
    String _temp = "";

    try {
      _key = int.parse(_keyController.text);
    } catch (e) {
      showAlert("Invalid Key");
    }

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        showAlert("Invalid Text");
        _temp = "";
        break;
      }
      int c;
      c = (ch + _key - offset) % 26;
      h = String.fromCharCode(c + offset);
      _temp += h;
    }
    setState(() {
      result = _temp;
    });
  }

  // int c;
  // if (_isEncrypt) {
  // c = (ch + _key - offset) % 26;
  // }
  // else {
  // c = (ch - _key - offset) % 26;
  // }
  void decrypt() {
    String _text = result;
    String _temp = "";
    try {
      _key = int.parse(_keyController.text);
    } catch (e) {
      showAlert("Invalid Key");
    }

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        showAlert("Invalid Text");
        _temp = "";
        break;
      }
      int c;
      c = (ch - _key - offset) % 26;
      h = String.fromCharCode(c + offset);
      _temp += h;
    }
    setState(() {
      result = _temp;
    });
  }

  Future<void> showAlert(String _alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(.8),
          title: Text('Something is Wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_alert),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
