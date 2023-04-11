import 'package:flutter/material.dart';
import 'package:mygellary/core/constant.dart';

class LogInText extends StatelessWidget {
  const LogInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('LOG IN',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Gill Sans',
          fontSize: setFontSize(context) * .2,
          fontWeight: FontWeight.bold,
        ));
  }
}
