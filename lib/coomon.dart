import 'package:flutter/material.dart';

class custom_text extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color color;

  custom_text({
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily),
    );
  }
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
