import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/services/firebase_test.dart';
import 'screens/main_page.dart';

void main() async {
  // runApp(LoadLecture());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //fetchFirestoreData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BaumNuri',
      theme: ThemeData(),
      home: const MainPage(),
    );
  }
}
