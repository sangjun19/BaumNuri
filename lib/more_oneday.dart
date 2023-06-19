import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/services/api_service2.dart';
import 'package:nuri_01/models/lecture_card_model.dart';

final List<String> lecture_image = <String>[
  'images/healing_travel.jpg',
  'images/healing_travel.jpg',
  'images/semu.jpeg',
  'images/rpa.jpg',
  'images/com_internet.png',
  'images/visual.png',
  'images/fashion_item.jpg',
  'images/abata_uisang.jpg',
  'images/zep.png',
];

class more_lecture extends StatelessWidget {
  const more_lecture({Key? key});

  List<Widget> create_lecture(BuildContext context) {
    List<Widget> lecture = [];
    for (int i = 0; i < 9; i++) {
      Widget lec = FutureBuilder<List<LectureCardModel>>(
        future: ApiService.getLectureCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            if (i == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          }
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => information(
                      title: snapshot.data![i].title,
                      tutorName: snapshot.data![i].name,
                      content: snapshot.data![i].about,
                      date: snapshot.data![i].date,
                      time: snapshot.data![i].time,
                      agency: snapshot.data![i].agency,
                      place: snapshot.data![i].place,
                      price: snapshot.data![i].price,
                      how: snapshot.data![i].how,
                      number: snapshot.data![i].number,
                      img: AssetImage(lecture_image[i]),
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        lecture_image[i],
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![i].title,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "수강기간: ${snapshot.data![i].date}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "강좌내용: ${snapshot.data![i].about}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "수강료: ${snapshot.data![i].price}원",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "운영기관: ${snapshot.data![i].agency}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      );
      lecture.add(lec);
    }
    return lecture;
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
          '원데이 클래스',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/savedbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              ...create_lecture(context),
            ],
          ),
        ),
      ),
    );
  }
}
