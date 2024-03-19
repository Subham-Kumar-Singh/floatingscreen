import 'package:floatingscreen/screens/firstscreen.dart';
import 'package:floatingscreen/screens/secondscreen.dart';
import 'package:floatingscreen/screens/thirdscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => Secondscreen(),
        '/third': (context) => Thirdscreen(),
      },
      // home: FirstScreen(),
    );
  }
}
