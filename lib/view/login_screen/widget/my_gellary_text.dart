import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class MyGellaryText extends StatelessWidget {
  const MyGellaryText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('My\nGellary',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Gill Sans',
          fontSize: setFontSize(context) * .35,
          fontWeight: FontWeight.bold,
        ));
  }
}
