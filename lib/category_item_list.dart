import 'package:flutter/material.dart';
import 'package:nuri_01/category_item_card.dart';

class CategoryItemList extends StatelessWidget {
  CategoryItemList({super.key});

  int _selectedIndex = 0;

  List<CategoryItemCard> cards = [
    const CategoryItemCard(
      imgUrl: "assets/images/gardening1.jpg",
      title: "정원 가꾸기 기초",
      date: "2023년 6월 1일 ~ 2023년 7월 31일",
      content: "강좌내용: 작은 정원을 가꾸어 보아요",
      price: "수강료: 10,000원",
      agency: "운영기관: 대전광역시 유성구청",
    ),
    const CategoryItemCard(
      imgUrl: "assets/images/gardening2.png",
      title: "농사법 입문",
      date: "2023년 6월 1일 ~ 2023년 7월 31일",
      content: "강좌내용: 농사법 기본 강좌",
      price: "수강료: 20,000원",
      agency: "운영기관: 대전광역시 유성구청",
    ),
    const CategoryItemCard(
      imgUrl: "assets/images/gardening3.jpg",
      title: "생활원예 반려식물",
      date: "2023년 5월 1일 ~ 2023년 7월 31일",
      content: "강좌내용: 반려식물을 키워보는 강좌",
      price: "수강료: 30,000원",
      agency: "운영기관: 대전광역시 유성구청",
    ),
    const CategoryItemCard(
      imgUrl: "assets/images/gardening4.jpg",
      title: "식물 기르기 입문",
      date: "2023년 5월 1일 ~ 2023년 7월 31일",
      content: "강좌내용: 간단한 식물을 기르는 강좌",
      price: "수강료: 10,000원",
      agency: "운영기관: 대전광역시 유성구청",
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left_outlined),
          color: Colors.black,
          iconSize: 40,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '원예',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 30,
          right: 30,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/savedbackground.png'),
                fit: BoxFit.cover
            )
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return cards[index];
            },
            separatorBuilder: (context, index) {
              return Column(
                children: const [
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 500,
                    child: Divider(
                      color: Colors.green,
                      thickness: 0.7,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              );
            },
            itemCount: cards.length),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '메인',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmark),
      //       label: '저장',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '마이페이지',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
