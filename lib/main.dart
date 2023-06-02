import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/screens/main_page.dart';
import 'package:nuri_01/start_screen.dart';
import 'my_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: MainPage(),
    );
  }
}
