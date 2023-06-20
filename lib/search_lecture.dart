import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/services/api_service.dart';
import 'package:nuri_01/models/lecture_card_model.dart';

final List<String> lecture_image = <String>[
  'images/japanese.png',
  'images/speech.png',
  'images/guitar.png',
  'images/song_class.jpeg',
  'images/biggold.jpg',
  'images/talk_pocket.jpg',
  'images/black_white_stone.jpg',
  'images/dei.jpg',
  'images/healing_travel.jpg',
];

class search_lecture extends StatelessWidget {
  final String value;
  const search_lecture(this.value, {Key? key});
  List<Widget> create_lecture(BuildContext context) {
    List<Widget> lecture = [];
    List<LectureCardModel> filteredData = [];

    // 데이터 가져오기
    Future<List<LectureCardModel>> lectureCardsFuture = ApiService.getLectureCards();
    lectureCardsFuture.then((data) {
      filteredData = data.where((item) => item.title.contains(value) || item.about.contains(value) || item.name.contains(value) || item.date.contains(value) || item.time.contains(value) || item.agency.contains(value) || item.place.contains(value) || item.price.contains(value) || item.how.contains(value) || item.number.contains(value)).toList();
    });

    for (int i = 0; i < 50; i++) {
      Widget lec = FutureBuilder<List<LectureCardModel>>(
        future: lectureCardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            if (i == 0) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          }
          if (snapshot.hasData) {
            if (i < filteredData.length) {
              LectureCardModel lectureCard = filteredData[i];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => information(
                        title: lectureCard.title,
                        tutorName: lectureCard.name,
                        content: lectureCard.about,
                        date: lectureCard.date,
                        time: lectureCard.time,
                        agency: lectureCard.agency,
                        place: lectureCard.place,
                        price: lectureCard.price,
                        how: lectureCard.how,
                        number: lectureCard.number,
                        img: AssetImage(lecture_image[i%9]),
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
                          lecture_image[i%9],
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
                              lectureCard.title,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "수강기간: ${lectureCard.date}",
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "강좌내용: ${lectureCard.about}",
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "수강료: ${lectureCard.price}원",
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "운영기관: ${lectureCard.agency}",
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
            } else {
              return Container();
            }
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
    return Container (
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/savedbackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
            '검색결과',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                Text(
                  '  검색어: $value',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...create_lecture(context),
              ],
            ),
          ],
        )
      ),
    );
  }
}