import 'package:flutter/material.dart';
import 'package:mygellary/core/dio_helper.dart';
import 'package:mygellary/view/login_screen/login_screen.dart';
import 'package:mygellary/view/my_gellary/my_gellary.dart';

void main() {
  DioHelper.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gellary',
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        MyGellary.routeName: (context) => const MyGellary(),
      },
      home: LoginScreen(),
    );
  }
}
