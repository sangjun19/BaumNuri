import 'package:flutter/material.dart';
import 'package:nuri_01/sangse.dart';
import 'main_page.dart';
import 'my_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: main_page(),
    );
  }
}
