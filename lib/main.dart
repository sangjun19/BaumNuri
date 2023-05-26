import 'package:flutter/material.dart';
import 'screens/main_page.dart';

void main() {
  // runApp(LoadLecture());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BaeumNuri',
      theme: ThemeData(),
      home: const MainPage(),
    );
  }
}
