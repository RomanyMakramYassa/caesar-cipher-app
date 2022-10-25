import 'package:flutter/material.dart';

import 'caeser.dart';
import 'coomon.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: custom_text(
            text: 'Eng: Romany ',
            size: 35,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: "Pacifico"),
      ),
      backgroundColor: Colors.blueGrey.withOpacity(.2),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                custom_text(
                    text: "Ciphers",
                    size: 35,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Pacifico"),
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  "assets/1.png",
                  width: 150,
                ),
                SizedBox(
                  height: 5,
                ),
                custom_text(
                    text: "Please choose a cipher : ",
                    size: 25,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Pacifico"),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.tealAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ))),
                  child: custom_text(
                      text: "caesar-cipher",
                      size: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: "Amiri"),
                  onPressed: () {
                    nextScreenReplace(context, Caesar());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
