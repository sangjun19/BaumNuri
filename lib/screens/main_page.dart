import 'package:flutter/material.dart';
import 'package:nuri_01/onedayclass.dart';

import '../bookmark_page.dart';
import '../around_lecture.dart';
import '../category.dart';
import '../my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

var value = "";

class _MainPageState extends State<MainPage> {
  // final myController = TextEditingController();
  // static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  int _selectedIndex = 0; // 바텀바 누를때마다 화면 바꿀 때 사용하는 인덱스
  // late Future<List<LectureCardModel>> lectureCards;

  // @override
  // void initState() {
  //   super.initState();

  //   lectureCards = ApiService.getLectureCards();
  // }

  // 메인, 저장, 마이페이지 화면 위젯들을 리스트에 담아 둠
  static final List<Widget> _widgetOptions = <Widget>[
    // 메인
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          // 상단 배너 뭉탱이
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    iconSize: 34,
                    onPressed: () {
                      print("filter");
                    },
                    icon: Image.asset(
                      "images/filter.png",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(
                      40, 0, 0, 0), // Adjust the padding values as needed
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
                  padding: EdgeInsets.fromLTRB(
                      40, 5, 0, 0), // Adjust the padding values as needed
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
                              color: Colors.white, fontWeight: FontWeight.w200),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (text) {
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

          // 내 주변 교육강좌
          around_lecture(),

          // 원데이 클래스
          const oneday_lecture(),
        ],
      ),
    ),

    // 저장
    const bookmark_page(),

    // 마이페이지
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
        // 바텀바 눌러져있는 버튼에 맞는 화면 띄움
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
        selectedItemColor: const Color(0xFF336D58),
        onTap: _onItemTapped, // 누른 버튼에 해당하는 인덱스로 갱신
      ),
    );
  }
}
