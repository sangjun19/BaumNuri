import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'around_lecture.dart';

class bookmark_page extends StatelessWidget {
  const bookmark_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('저장된 강좌'),
        backgroundColor: Color(0xFF7DB19F),
      ),
      body: ListView(
        children: create_lecture(context),
      ),
    );
  }
}