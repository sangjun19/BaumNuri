import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'LoadLecture.dart';
import 'main_page.dart';
import 'my_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(LoadLecture());
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const main_page(),
    );
  }
}
