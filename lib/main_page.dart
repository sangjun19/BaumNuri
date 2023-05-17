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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.png')
                )
            ),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                IconButton(
                  //padding: const EdgeInsets.all(20),
                    iconSize: 40,
                    onPressed: () {
                      print("filter");
                    },
                    icon: Image.asset(
                      "images/filter.png",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0), // Adjust the padding values as needed
                  child: Text(
                    '배움으로 세상을 누리다.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 5, 0, 0), // Adjust the padding values as needed
                  child: Text(
                    '배움누리',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 290,
                      height: 42,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '찾으시는 강좌를 입력하세요',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (text){
                          value = text;
                        },
                        obscureText: false,
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.search),
                      color: Colors.white,
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
          const around_lecture(),
          //around_lecture(),
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
        selectedItemColor: Color(0xFF336D58),
        onTap: _onItemTapped,
      ),
    );
  }
}

