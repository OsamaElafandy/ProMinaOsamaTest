import 'package:flutter/material.dart';
import 'package:mygellary/core/constant.dart';

class WelcomeText extends StatelessWidget {
  final String myName;
  const WelcomeText({super.key, required this.myName});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome\n$myName',
      textAlign: TextAlign.left,
      style: (TextStyle(
        color: Colors.black,
        fontSize: setFontSize(context) * .21,
        fontWeight: FontWeight.w300,
      )),
    );
  }
}
