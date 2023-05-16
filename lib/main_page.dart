import 'package:flutter/material.dart';

import 'bookmark_page.dart';
import 'around_lecture.dart';
import 'category.dart';
import 'my_page.dart';

/// Flutter code sample for [BottomNavigationBar].

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() =>
      _main_page();
}
var value = "";
class _main_page extends State<main_page> {
  final myController = TextEditingController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            height: 350,
            color: Colors.green,
            child: Column (
              children: [
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.filter_alt),
                  onPressed: () {
                    print('filter');
                  },
                ),
                const Text(
                    '배움으로 세상을 누리다.'
                ),
                const Text(
                    '배움누리'
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '검색하기',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text){
                          value = text;
                        },
                        obscureText: false,
                      ),
                    ),
                    IconButton(
                      iconSize: 65,
                      icon: const Icon(Icons.search),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        print(value);
                      },
                    ),
                  ],
                ),
                const category(),
              ],
            ),
          ),
          around_lecture(),
          around_lecture(),
        ],
      ),
    ),
    const bookmark_page(),
    const my_page(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '메인',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '저장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

